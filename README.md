# AMMOcoin Wallet
### Cross-Platform Cryptocurrency Wallet built with Flutter

<div align="center">

![AMMOcoin Logo](https://img.shields.io/badge/AMMOcoin-v1.1.0-blue?style=for-the-badge&logo=bitcoin&logoColor=white)
![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Material Design](https://img.shields.io/badge/Material%20Design-3-4285F4?style=for-the-badge&logo=material-design&logoColor=white)

[![License](https://img.shields.io/github/license/everquin/AMMOcoin_App?style=for-the-badge)](LICENSE)
[![Release](https://img.shields.io/github/v/release/everquin/AMMOcoin_App?style=for-the-badge)](https://github.com/everquin/AMMOcoin_App/releases)
[![Issues](https://img.shields.io/github/issues/everquin/AMMOcoin_App?style=for-the-badge)](https://github.com/everquin/AMMOcoin_App/issues)

**A beautiful, modern, cross-platform wallet for AMMOcoin cryptocurrency**

[Download](#installation) • [Features](#features) • [Build Guide](#building) • [Contributing](#contributing)

</div>

## 🌟 Overview

AMMOcoin Wallet is a professional, feature-rich cryptocurrency wallet built with Flutter, supporting **macOS, Windows, Linux, Web, and mobile platforms**. It provides a modern Material Design 3 interface with comprehensive wallet management capabilities.

### ✨ Key Features

- 🎨 **Beautiful Material Design 3 UI** with light and dark themes
- 💰 **Real-time Balance Tracking** with detailed breakdowns
- 📊 **Transaction History** with advanced filtering and search
- 🔒 **Staking Support** with live status and rewards tracking
- 🌐 **Cross-Platform** - One codebase, all platforms
- 🚀 **High Performance** with native compilation
- 🔐 **Secure** with encrypted local storage
- 🌍 **Network Monitoring** with real-time connection status

## 🖥️ Platform Support

| Platform | Status | Download |
|----------|---------|----------|
| 🍎 **macOS** | ✅ Ready | [Download DMG](#) |
| 🪟 **Windows** | ✅ Ready | [Download EXE](#) |
| 🐧 **Linux** | ✅ Ready | [Download AppImage](#) |
| 🌐 **Web** | ✅ Ready | [Launch App](#) |
| 📱 **iOS** | 🚧 Coming Soon | - |
| 📱 **Android** | 🚧 Coming Soon | - |

## 📱 Screenshots

<div align="center">

| Light Theme | Dark Theme | Transaction History |
|-------------|------------|---------------------|
| <img src="docs/screenshots/light-theme.png" width="300"/> | <img src="docs/screenshots/dark-theme.png" width="300"/> | <img src="docs/screenshots/transactions.png" width="300"/> |

</div>

## 🚀 Quick Start

### Prerequisites

- **AMMOcoin Daemon**: Download from [AMMOcoin Releases](https://github.com/everquin/AMMOcoin/releases)
- **Flutter SDK**: Required for building from source ([Install Guide](https://docs.flutter.dev/get-started/install))

### Installation

#### Option 1: Download Pre-built Binaries (Recommended)

1. Visit our [Releases Page](https://github.com/everquin/AMMOcoin_App/releases)
2. Download the appropriate version for your platform
3. Install and run the application

#### Option 2: Build from Source

```bash
# Clone the repository
git clone https://github.com/everquin/AMMOcoin_App.git
cd AMMOcoin_App

# Install dependencies
flutter pub get

# Generate model files
flutter packages pub run build_runner build

# Run on your platform
flutter run -d macos    # macOS
flutter run -d windows  # Windows
flutter run -d linux    # Linux
flutter run -d chrome   # Web
```

### Configuration

1. **Start AMMOcoin Daemon** with RPC enabled:
   ```bash
   ammocoind -rpcuser=your_username -rpcpassword=your_password -rpcport=8332
   ```

2. **Configure Wallet** (optional):
   - Default connection: `127.0.0.1:8332`
   - The app will auto-detect running daemon
   - Settings can be modified in the app

## 🏗️ Architecture

```
AMMOcoin_App/
├── lib/
│   ├── models/          # Data models with JSON serialization
│   ├── services/        # RPC communication layer
│   ├── providers/       # State management (Riverpod)
│   ├── screens/         # UI screens and pages
│   ├── widgets/         # Reusable UI components
│   └── utils/           # Helpers, formatters, themes
├── assets/              # Images, fonts, animations
├── binaries/            # Symlinks to AMMOcoin binaries
└── platform/            # Platform-specific code
```

### 🔧 Technology Stack

- **Framework**: Flutter 3.x with Dart
- **UI**: Material Design 3 with Google Fonts
- **State Management**: Riverpod for reactive programming
- **Storage**: Hive for local data, Secure Storage for sensitive data
- **Networking**: Dio for HTTP, JSON-RPC 2.0 for daemon communication
- **Cryptography**: PointyCastle, BIP39 for wallet operations

## 🔑 Core Features

### 💳 Wallet Management
- **Balance Overview**: Real-time balance with confirmed, pending, and staking breakdown
- **Multi-Address Support**: Manage multiple receiving addresses
- **HD Wallet**: Hierarchical deterministic wallet support
- **Backup & Recovery**: Seed phrase backup and wallet restoration

### 💸 Transactions
- **Send & Receive**: Intuitive transaction creation with QR code support
- **Transaction History**: Detailed history with filtering and search
- **Fee Estimation**: Smart fee calculation for optimal transaction speed
- **Batch Operations**: Send to multiple addresses in one transaction

### 🏆 Staking
- **Staking Dashboard**: Live staking status and statistics
- **Reward Tracking**: Track staking rewards and performance
- **Staking Calculator**: Estimate potential returns
- **Auto-Staking**: Automated staking configuration

### 🔒 Security
- **Encrypted Storage**: All sensitive data encrypted locally
- **Passphrase Protection**: Wallet encryption with user passphrase
- **Biometric Authentication**: Support for Touch ID/Face ID (mobile)
- **Hardware Wallet**: Future support for hardware wallets

## 🛠️ Building

### Development Setup

```bash
# Clone the repository
git clone https://github.com/everquin/AMMOcoin_App.git
cd AMMOcoin_App

# Install dependencies
flutter pub get

# Generate code
flutter packages pub run build_runner build

# Run in development mode
flutter run -d macos --debug
```

### Production Builds

```bash
# Build for macOS
flutter build macos --release

# Build for Windows
flutter build windows --release

# Build for Linux
flutter build linux --release

# Build for Web
flutter build web --release
```

### 📦 Release Packaging

```bash
# Create DMG for macOS
create-dmg --volname "AMMOcoin Wallet" build/macos/Build/Products/Release/

# Create installer for Windows
flutter build windows --release
# Use NSIS or similar to create installer

# Create AppImage for Linux
flutter build linux --release
# Use appimagetool to create AppImage
```

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Workflow

1. **Fork** the repository
2. **Create** a feature branch (`git checkout -b feature/amazing-feature`)
3. **Commit** your changes (`git commit -m 'Add amazing feature'`)
4. **Push** to the branch (`git push origin feature/amazing-feature`)
5. **Open** a Pull Request

### 🐛 Bug Reports

Found a bug? Please [open an issue](https://github.com/everquin/AMMOcoin_App/issues/new) with:
- Detailed description
- Steps to reproduce
- Expected vs actual behavior
- Platform information
- Screenshots if applicable

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **AMMOcoin Core Team** for the underlying blockchain technology
- **Flutter Team** for the amazing cross-platform framework
- **Material Design** for the beautiful design system
- **Open Source Community** for the countless libraries and tools

## 📞 Support

- 💬 **Community**: [Discord](https://discord.gg/ammocoin)
- 🐦 **Twitter**: [@AMMOcoin](https://twitter.com/ammocoin)
- 📧 **Email**: support@ammocoin.com
- 📚 **Documentation**: [Wiki](https://github.com/everquin/AMMOcoin_App/wiki)

---

<div align="center">

**Made with ❤️ by the AMMOcoin Community**

⭐ **Star this repo if you find it helpful!** ⭐

</div>