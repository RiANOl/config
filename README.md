# Configuration Management

Personal dotfiles and configuration management system for macOS development environment.

## Overview

This repository contains configuration files and setup scripts for a complete development environment, including shell configurations, application settings, and automated installation scripts.

## Structure

- `home/` - Dotfiles for the home directory
- `config/` - Application-specific configuration files
- `Brewfile` - Homebrew package definitions
- `install.sh` - Initial setup script for symlinking configurations
- `update.sh` - Script to update this repository

## Installation

Run the installation script to set up symlinks to your configuration files:

```zsh
./install.sh
```

This will:
- Create symlinks for home directory dotfiles
- Set up application configs in `~/.config/`
- Install and configure Zim framework for zsh

To install Homebrew packages:

```zsh
brew bundle
```

## Updating

To pull the latest configuration changes:

```zsh
./update.sh
```

## Features

- **Safe Installation**: Backs up existing files before creating symlinks
- **Modular Structure**: Organized configuration files by category
- **Zsh Integration**: Includes Zim framework setup for enhanced shell experience
- **Error Handling**: Scripts include proper error handling and safety checks
