#!/bin/bash

# Base URL for the repository
REPO_BASE_URL="https://github.com/filsv/iOSDeviceSupport/raw/master"

# DeviceSupport directory in Xcode
DEVICE_SUPPORT_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport"

# Function to determine fallback version for unsupported versions
get_fallback_version() {
    case "$1" in
        16.9|16.8|16.7) echo "16.5" ;;
        *) echo "$1" ;;
    esac
}

# Prompt for iOS version
read -p "Enter the iOS version (e.g., 16.6): " IOS_VERSION

# Validate input format (must be X.Y, e.g., 16.6)
if [[ ! "$IOS_VERSION" =~ ^[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Invalid version format. Please use a format like '16.6'."
    exit 1
fi

# Determine the fallback version
FALLBACK_VERSION=$(get_fallback_version "$IOS_VERSION")

# Generate the download URL
DOWNLOAD_URL="$REPO_BASE_URL/$FALLBACK_VERSION.zip"

# Temporary directory for downloading
TEMP_DIR=$(mktemp -d)

# Check if the file exists on the server
echo "Checking availability for iOS Device Support files for version $FALLBACK_VERSION..."
if ! curl --head --silent --fail "$DOWNLOAD_URL" > /dev/null; then
    echo "Error: Device Support files for iOS version $FALLBACK_VERSION do not exist."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Download the zip file
echo "Downloading iOS Device Support files for version $FALLBACK_VERSION..."
curl -L "$DOWNLOAD_URL" -o "$TEMP_DIR/$FALLBACK_VERSION.zip"
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to download the file from $DOWNLOAD_URL."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Unzip the downloaded file
echo "Unzipping the downloaded file..."
unzip -q "$TEMP_DIR/$FALLBACK_VERSION.zip" -d "$TEMP_DIR"
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to unzip the file. The downloaded file might be corrupted."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Verify the unzipped folder exists and is not empty
if [[ ! -d "$TEMP_DIR/$FALLBACK_VERSION" || -z "$(ls -A $TEMP_DIR/$FALLBACK_VERSION)" ]]; then
    echo "Error: The unzipped folder is empty or does not match the expected structure."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Copy the files to the DeviceSupport directory
echo "Installing to $DEVICE_SUPPORT_DIR..."
sudo cp -R "$TEMP_DIR/$FALLBACK_VERSION" "$DEVICE_SUPPORT_DIR/"
if [[ $? -ne 0 ]]; then
    echo "Error: Failed to copy files to $DEVICE_SUPPORT_DIR. Ensure you have sudo access."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Adjust permissions to make the folder accessible
sudo chmod -R 755 "$DEVICE_SUPPORT_DIR/$FALLBACK_VERSION"
sudo chown -R $(whoami) "$DEVICE_SUPPORT_DIR/$FALLBACK_VERSION"

# Rename if using a fallback
if [[ "$IOS_VERSION" != "$FALLBACK_VERSION" ]]; then
    echo "Renaming the installed folder to match version $IOS_VERSION..."
    sudo mv "$DEVICE_SUPPORT_DIR/$FALLBACK_VERSION" "$DEVICE_SUPPORT_DIR/$IOS_VERSION"
    sudo chmod -R 755 "$DEVICE_SUPPORT_DIR/$IOS_VERSION"
    sudo chown -R $(whoami) "$DEVICE_SUPPORT_DIR/$IOS_VERSION"
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to rename the folder to $IOS_VERSION."
        rm -rf "$TEMP_DIR"
        exit 1
    fi
    echo "Note: Files were downloaded for $FALLBACK_VERSION but renamed to $IOS_VERSION for compatibility."
fi

# Rename if using a fallback
if [[ "$IOS_VERSION" != "$FALLBACK_VERSION" ]]; then
    echo "Renaming the installed folder to match version $IOS_VERSION..."
    sudo mv "$DEVICE_SUPPORT_DIR/$FALLBACK_VERSION" "$DEVICE_SUPPORT_DIR/$IOS_VERSION"
    if [[ $? -ne 0 ]]; then
        echo "Error: Failed to rename the folder to $IOS_VERSION."
        rm -rf "$TEMP_DIR"
        exit 1
    fi
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
