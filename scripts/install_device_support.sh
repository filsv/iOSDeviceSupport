#!/bin/bash

# Base URL for the repository
REPO_BASE_URL="https://github.com/filsv/iOSDeviceSupport/raw/master"

# DeviceSupport directory in Xcode
DEVICE_SUPPORT_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport"

# Fallback mapping for unavailable versions (string keys)
declare -A FALLBACK_VERSIONS=(
    ["16.9"]="16.5"
    ["16.8"]="16.5"
    ["16.7"]="16.5"
)

# Prompt for iOS version
read -p "Enter the iOS version (e.g., 16.6): " IOS_VERSION

# Check if the version has a fallback
if [[ -n "${FALLBACK_VERSIONS[$IOS_VERSION]}" ]]; then
    echo "Version $IOS_VERSION does not exist. Using fallback version ${FALLBACK_VERSIONS[$IOS_VERSION]} instead."
    FALLBACK_VERSION=${FALLBACK_VERSIONS[$IOS_VERSION]}
else
    FALLBACK_VERSION=$IOS_VERSION
fi

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
