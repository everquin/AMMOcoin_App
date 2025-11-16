# Building AMMOcoin Wallet

This document provides comprehensive instructions for building the AMMOcoin Wallet on different platforms.

## Prerequisites

- **Flutter SDK**: 3.9.0 or higher ([Install Guide](https://docs.flutter.dev/get-started/install))
- **Git**: For cloning the repository
- **Platform-specific toolchains** (see below)

## Quick Start

```bash
# Clone the repository
git clone https://github.com/everquin/AMMOcoin_App.git
cd AMMOcoin_App

# Install dependencies
flutter pub get

# Generate model files
flutter packages pub run build_runner build

# Enable required platforms
flutter config --enable-web --enable-macos-desktop --enable-windows-desktop --enable-linux-desktop
```

## Platform-Specific Instructions

### 🍎 macOS

#### Prerequisites
- macOS 10.15 or higher
- Xcode 12.0 or higher
- CocoaPods

#### Development Build
```bash
flutter run -d macos --debug
```

#### Production Build
```bash
flutter build macos --release
```

#### Create DMG
```bash
# Copy app to staging area
mkdir -p dist/dmg-temp
cp -r build/macos/Build/Products/Release/ammocoin_app.app dist/dmg-temp/"AMMOcoin Wallet.app"

# Create DMG
hdiutil create -volname "AMMOcoin Wallet v1.1.0" -srcfolder dist/dmg-temp -ov -format UDZO dist/AMMOcoin_Wallet_v1.1.0_macOS.dmg

# Clean up
rm -rf dist/dmg-temp
```

### 🪟 Windows

#### Prerequisites
- Windows 10 version 1903 or higher
- Visual Studio 2019 or higher with C++ development tools
- Windows 10 SDK

#### Development Build
```bash
flutter run -d windows --debug
```

#### Production Build
```bash
flutter build windows --release
```

#### Create Installer
You can use tools like NSIS or Inno Setup to create an installer:

```bash
# The built app will be in build/windows/runner/Release/
# Use your preferred installer tool to package it
```

### 🐧 Linux

#### Prerequisites
- Ubuntu 20.04 or equivalent
- GTK 3.0 development libraries
- pkg-config

```bash
# Ubuntu/Debian
sudo apt-get update
sudo apt-get install build-essential libgtk-3-dev pkg-config

# Fedora
sudo dnf install gtk3-devel pkgconf-devel

# Arch Linux
sudo pacman -S gtk3 pkgconf base-devel
```

#### Development Build
```bash
flutter run -d linux --debug
```

#### Production Build
```bash
flutter build linux --release
```

#### Create AppImage
```bash
# Install appimagetool
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage
chmod +x appimagetool-x86_64.AppImage

# Create AppImage structure
mkdir -p dist/AMMOcoin.AppDir/usr/bin
cp -r build/linux/x64/release/bundle/* dist/AMMOcoin.AppDir/usr/bin/

# Create desktop file and icon (see AppImage documentation)
# Then build AppImage
./appimagetool-x86_64.AppImage dist/AMMOcoin.AppDir dist/AMMOcoin_Wallet_v1.1.0_Linux.AppImage
```

### 🌐 Web

#### Prerequisites
- Modern web browser
- Web server (for deployment)

#### Development Build
```bash
flutter run -d chrome --debug
```

#### Production Build
```bash
flutter build web --release
```

#### Deploy to Web Server
```bash
# The built files will be in build/web/
# Copy these files to your web server
cp -r build/web/* /path/to/your/webserver/
```

## Cross-Platform Considerations

### Building on Different Hosts

**Important**: Flutter requires the host operating system to match the target platform for desktop builds:

- **macOS builds**: Require macOS host
- **Windows builds**: Require Windows host
- **Linux builds**: Require Linux host
- **Web builds**: Can be built on any platform

### Continuous Integration

For automated builds across all platforms, consider using GitHub Actions with multiple runners:

```yaml
# .github/workflows/build.yml
strategy:
  matrix:
    os: [ubuntu-latest, windows-latest, macos-latest]
    include:
      - os: ubuntu-latest
        flutter-platform: linux
      - os: windows-latest
        flutter-platform: windows
      - os: macos-latest
        flutter-platform: macos
```

## Distribution Files

After building, you'll have the following distribution files:

### macOS
- `ammocoin_app.app` - Native macOS application
- `AMMOcoin_Wallet_v1.1.0_macOS.dmg` - Installer disk image

### Windows
- `ammocoin_app.exe` - Native Windows executable (plus DLLs)
- Installer package (created with your chosen installer tool)

### Linux
- `ammocoin_app` - Native Linux executable (plus libraries)
- `AMMOcoin_Wallet_v1.1.0_Linux.AppImage` - Portable AppImage

### Web
- `build/web/` directory - Complete web application
- `AMMOcoin_Wallet_v1.1.0_Web.tar.gz` - Compressed web files

## Troubleshooting

### Common Issues

#### Google Fonts Network Errors
If you see network errors related to Google Fonts during development, they're warnings only and won't affect functionality. The app falls back to system fonts.

#### Build Dependencies
Make sure all platform-specific dependencies are installed before building:

```bash
# Check Flutter environment
flutter doctor -v

# Fix any issues reported before proceeding
```

#### Asset Issues
If you encounter asset loading errors:

```bash
# Regenerate assets
flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

## Performance Optimization

### Release Builds
Always use `--release` flag for production builds:
- Smaller file sizes
- Better performance
- Optimized code

### Web Optimization
For web builds, consider:
- Using `--web-renderer canvaskit` for better performance
- Enabling `--tree-shake-icons` to reduce bundle size
- Optimizing images and assets

## Security Considerations

### Code Signing (Production)

#### macOS
```bash
# Sign the app bundle
codesign --force --deep --sign "Developer ID Application: Your Name" dist/AMMOcoin_Wallet_v1.1.0_macOS.app

# Notarize with Apple (requires Apple Developer account)
xcrun notarytool submit dist/AMMOcoin_Wallet_v1.1.0_macOS.dmg --wait
```

#### Windows
Use a code signing certificate to sign the executable and installer.

### Security Best Practices
- Keep dependencies updated
- Use secure storage for sensitive data
- Validate all RPC communications
- Implement proper error handling

## Support

For build issues or questions:
- Check [Flutter documentation](https://docs.flutter.dev/)
- Review [GitHub Issues](https://github.com/everquin/AMMOcoin_App/issues)
- Join our [Discord community](https://discord.gg/ammocoin)

---

**Happy Building!** 🚀