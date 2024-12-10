#!/bin/bash

# Base URL for the repository
REPO_BASE_URL="https://github.com/filsv/iOSDeviceSupport/raw/master"

# DeviceSupport directory in Xcode
DEVICE_SUPPORT_DIR="/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport"

# Prompt for iOS version
read -p "Enter the iOS version (e.g., 16.6): " IOS_VERSION

# Generate the download URL
DOWNLOAD_URL="$REPO_BASE_URL/$IOS_VERSION.zip"

# Temporary directory for downloading
TEMP_DIR=$(mktemp -d)

# Download the zip file
echo "Downloading iOS Device Support files for version $IOS_VERSION..."
curl -L "$DOWNLOAD_URL" -o "$TEMP_DIR/$IOS_VERSION.zip"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to download files. Check the iOS version or your internet connection."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Unzip the downloaded file
echo "Unzipping the downloaded file..."
unzip -q "$TEMP_DIR/$IOS_VERSION.zip" -d "$TEMP_DIR"

# Verify the unzipped folder exists
if [ ! -d "$TEMP_DIR/$IOS_VERSION" ]; then
    echo "Error: The unzipped folder does not match the expected structure."
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Copy the files to the DeviceSupport directory
echo "Installing to $DEVICE_SUPPORT_DIR..."
sudo cp -R "$TEMP_DIR/$IOS_VERSION" "$DEVICE_SUPPORT_DIR/"

# Cleanup
rm -rf "$TEMP_DIR"

echo "Installation complete! Restart Xcode to apply changes."

# Additional notes for iOS 17+
if [[ "$IOS_VERSION" == 17* ]]; then
    echo "Note: For iOS 17+, enable Developer Mode by running the following command:"
    echo "defaults write com.apple.dt.Xcode DVTEnableCoreDevice enabled"
    echo "Then restart Xcode."
fi
