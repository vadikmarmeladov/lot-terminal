# LOT Terminal

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Open Source](https://img.shields.io/badge/Open%20Source-Yes-green.svg)](https://github.com/vadikmarmeladov/lot-terminal)

**LOT Terminal** is an open-source developer playground and backend system for hardware development, prototyping, and experimentation.

> 🔓 **Fully Open Source** | 🛠️ **Developer-First** | 🔌 **Hardware-Ready** | 📝 **Zero Dependencies**

**👋 New to terminals?** Start here: **[Getting Started Guide](GETTING_STARTED.md)** - A beginner-friendly introduction!

## ⚠️ Important Notice

This is an **open-source developer playground and backend system**. It does **NOT** provide access to lot-systems.com or any commercial services. This tool is designed for:

- 🔧 Hardware development and prototyping
- 💻 Developer experimentation and learning
- 🌐 Open-source contribution and collaboration
- 🔌 Backend system integration (where authorized)

## 🚀 Quick Start

### Installation

One-line installation:

```bash
curl -sSL https://raw.githubusercontent.com/vadikmarmeladov/lot-terminal/main/install.sh | bash
```

Or manual installation:

```bash
# Clone the repository
git clone https://github.com/vadikmarmeladov/lot-terminal.git
cd lot-terminal

# Run installer
bash install.sh
```

### First Run

```bash
# Initialize LOT Terminal
lot init

# View all commands
lot help

# Edit your settings
lot config
```

## 📚 Features

### 🎛️ Settings Management

Personal configuration via `.env` files stored in `~/.lot/`:

```bash
# Edit your settings
lot config

# View all settings
lot settings list

# Set a specific setting
lot settings set LOT_USER_NAME john

# Get a specific setting
lot settings get LOT_USER_NAME
```

Your settings are stored in `~/.lot/.env` and include:
- User information
- Developer mode preferences
- Hardware development options
- Logging configuration

### 📊 Activity Logging

All activities are automatically logged to `~/.lot/logs/lot.log`:

```bash
# View recent logs
lot logs

# Tail logs in real-time
lot logs tail

# Clear old logs
lot logs clear
```

### 👥 User Management

Create and manage multiple user profiles:

```bash
# Create a new user profile
lot user create alice

# List all users
lot user list

# Edit user profile
lot user edit alice

# Delete user
lot user delete alice
```

User profiles are stored in `~/.lot/users/` as individual `.env` files.

### 🔩 Hardware Development

LOT Terminal includes tools for hardware project management:

```bash
# Create a new hardware project
lot hardware init weather-station

# List all hardware projects
lot hardware list

# Open a project
lot hardware open weather-station
```

Each hardware project includes:
- `firmware/` - Embedded software/firmware code
- `schematics/` - Circuit schematics
- `pcb/` - PCB design files
- `docs/` - Documentation
- `images/` - Photos and renders

### 📈 Analytics & Statistics

```bash
# View system statistics
lot stats

# Check system status
lot status

# Run health check
lot doctor
```

## 🛠️ Commands Reference

| Command | Description |
|---------|-------------|
| `lot init` | Initialize LOT terminal (first time setup) |
| `lot help` | Show all commands |
| `lot config` | Edit your settings file |
| `lot settings list` | List all current settings |
| `lot settings set <key> <value>` | Set a configuration value |
| `lot settings get <key>` | Get a configuration value |
| `lot user create <name>` | Create a new user profile |
| `lot user list` | List all user profiles |
| `lot user edit <name>` | Edit a user profile |
| `lot user delete <name>` | Delete a user profile |
| `lot logs` | View recent logs |
| `lot logs tail` | Tail the log file |
| `lot logs clear` | Clear old logs |
| `lot stats` | View usage statistics |
| `lot hardware init <project>` | Create new hardware project |
| `lot hardware list` | List hardware projects |
| `lot hardware open <project>` | Open hardware project |
| `lot version` | Show version information |
| `lot status` | Show system status |
| `lot doctor` | Check system health |
| `lot clean` | Clean temporary files |

## 🏗️ Architecture

### Directory Structure

```
~/.lot/
├── .env                    # Your personal settings
├── logs/
│   └── lot.log            # Activity logs
├── users/
│   ├── alice.env          # User profiles
│   └── bob.env
└── hardware/
    ├── weather-station/   # Hardware projects
    │   ├── firmware/
    │   ├── schematics/
    │   ├── pcb/
    │   ├── docs/
    │   └── README.md
    └── sensor-array/
```

### Configuration Files

All configuration is done through `.env` files:

**Main Settings** (`~/.lot/.env`):
```bash
LOT_USER_NAME=developer
LOT_USER_EMAIL=dev@example.com
LOT_DEV_MODE=true
LOT_DEBUG=false
LOT_HARDWARE_ENABLED=true
LOT_LOG_LEVEL=INFO
LOT_LOG_RETENTION_DAYS=30
```

**User Profiles** (`~/.lot/users/<name>.env`):
```bash
USER_NAME=alice
USER_EMAIL=alice@example.com
USER_ROLE=developer
USER_CREATED=2025-01-15
PREFERRED_EDITOR=nano
HARDWARE_PROJECTS_ENABLED=true
```

## 🔧 Developer Guide

### Requirements

- **bash** (required)
- **curl** (for installation)
- **nano/vim/vi** (optional, for editing configs)

### Zero Dependencies

LOT Terminal is written in pure bash with zero external dependencies. All you need is a terminal!

### Extending LOT Terminal

LOT Terminal is designed to be hackable. All code is in `bin/lot` - a single bash script you can modify and extend.

Ideas for extensions:
- Add custom hardware project templates
- Integrate with your CI/CD pipeline
- Create custom logging formats
- Add project-specific commands

### Backend Integration

LOT Terminal can serve as a backend system for authorized services. The `.env` configuration system makes it easy to integrate with other tools:

```bash
# Example: Read settings from your application
source ~/.lot/.env
echo "User: $LOT_USER_NAME"
echo "Dev Mode: $LOT_DEV_MODE"
```

## 🎯 Use Cases

### For Hardware Developers

```bash
# Start a new hardware project
lot hardware init my-iot-device

# Navigate to project
cd ~/.lot/hardware/my-iot-device

# Add your firmware
echo "// Arduino code" > firmware/main.ino

# Document your project
vim README.md
```

### For Backend Developers

```bash
# Configure your environment
lot settings set API_KEY "your-key-here"
lot settings set DB_HOST "localhost"

# Access settings in your scripts
source ~/.lot/.env
echo $API_KEY
```

### For System Administrators

```bash
# Monitor system health
lot doctor

# Check logs
lot logs tail

# View statistics
lot stats
```

## 🎨 Hardware Projects

LOT Terminal includes designs for open-source hardware:

### LOT Psychotronic Weather Station

An open-source hardware project included in this repository:
- `LOT_Psychotronic_Weather_Station_2025.png` - Circuit board design
- `LOT_Psychotronic_Weather_Station_2027.png` - Radial device design

Build your own weather station with terminal-based UI that works completely offline!

See [HARDWARE.md](HARDWARE.md) for build instructions.

## 📖 Documentation

- **[GETTING_STARTED.md](GETTING_STARTED.md)** - Beginner-friendly guide for first-time users
- [CHANGELOG.md](CHANGELOG.md) - Version history
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines
- [HARDWARE.md](HARDWARE.md) - Hardware development guide
- [LICENSE](LICENSE) - MIT License

## 🤝 Contributing

We welcome contributions! LOT Terminal is fully open source.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

**Important:** While this software is open source and freely available, it does not grant access to lot-systems.com or any commercial services.

## 🔗 Links

- **Repository:** https://github.com/vadikmarmeladov/lot-terminal
- **Issues:** https://github.com/vadikmarmeladov/lot-terminal/issues
- **Discussions:** https://github.com/vadikmarmeladov/lot-terminal/discussions

## 🙏 Acknowledgments

- Built with ❤️ for the open-source hardware community
- Inspired by terminal-first developer tools
- Powered by bash and nothing else

## 📬 Support

- 🐛 Found a bug? [Open an issue](https://github.com/vadikmarmeladov/lot-terminal/issues)
- 💡 Have an idea? [Start a discussion](https://github.com/vadikmarmeladov/lot-terminal/discussions)
- 📧 Questions? Check the [documentation](HARDWARE.md) or open an issue

---

**Remember:** LOT Terminal is a developer playground. Experiment, break things, and build amazing hardware projects! 🚀