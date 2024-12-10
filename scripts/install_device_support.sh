#!/bin/bash

# Base URL for the repository
REPO_BASE_URL="https://github.com/filsv/iOSDeviceSupport/raw/master"

# DeviceSupport directory in Xcode
DEVICE_SUPPORT_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport"

# Function to get the fallback version for unsupported versions
get_fallback_version() {
    local version=$1
    case "$version" in
        16.9|16.8|16.7)
            echo "16.5"
            ;;
        *)
            echo "$version"
            ;;
    esac
}

# Prompt for iOS version
read -p "Enter the iOS version (e.g., 16.6): " IOS_VERSION

# Validate input format (must be X.Y, e.g., 16.6)
if [[ ! "$IOS_VERSION" =~ ^[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Invalid version format. Please use a format like '16.6'."
    exit 1
fi

# Determine the fallback version if needed
FALLBACK_VERSION=$(get_fallback_version "$IOS_VERSION")

# Generate the download URL
DOWNLOAD_URL="$REPO_BASE_URL/$FALLBACK_VERSION.zip"

# Temporary directory for downloading
TEMP_DIR=$(mktemp -d)

# Check if the file exists on the server
echo "Checking availability for iOS Device Support files for version $FALLBACK_VERSION..."
if ! curl --head --silent --fail "$DOWNLOAD_URL" > /dev/null; then
    echo "Error: Device Support files for iOS version $FALLBACK_VERSION do not exist."
    echo "Please check the available versions and try again."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Download the zip file
echo "Downloading iOS Device Support files for version $FALLBACK_VERSION..."
curl -L "$DOWNLOAD_URL" -o "$TEMP_DIR/$FALLBACK_VERSION.zip"

# Unzip the downloaded file
echo "Unzipping the downloaded file..."
unzip -q "$TEMP_DIR/$FALLBACK_VERSION.zip" -d "$TEMP_DIR"

# Verify the unzipped folder exists
if [ ! -d "$TEMP_DIR/$FALLBACK_VERSION" ]; then
    echo "Error: The unzipped folder does not match the expected structure."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Copy the files to the DeviceSupport directory
echo "Installing to $DEVICE_SUPPORT_DIR..."
sudo cp -R "$TEMP_DIR/$FALLBACK_VERSION" "$DEVICE_SUPPORT_DIR/"

# Rename if using a fallback
if [[ "$IOS_VERSION" != "$FALLBACK_VERSION" ]]; then
    echo "Renaming the installed folder to match version $IOS_VERSION..."
    sudo mv "$DEVICE_SUPPORT_DIR/$FALLBACK_VERSION" "$DEVICE_SUPPORT_DIR/$IOS_VERSION"
    echo "Note: Files were downloaded for $FALLBACK_VERSION but renamed to $IOS_VERSION for compatibility."
fi

# Cleanup
rm -rf "$TEMP_DIR"

echo "Installation complete! Restart Xcode to apply changes."

# Additional notes for iOS 17+
if [[ "$IOS_VERSION" == 17* ]]; then
    echo "Note: For iOS 17+, enable Developer Mode by running the following command:"
    echo "defaults write com.apple.dt.Xcode DVTEnableCoreDevice enabled"
    echo "Then restart Xcode."
fi
