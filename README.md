<!--toc:start-->
- [Overview](#overview)
- [MacOS Setup](#macos-setup)
  - [Clone Config](#clone-config)
  - [Neovim](#neovim)
    - [Mac OS](#mac-os)
    - [Linux (Ubuntu)](#linux-ubuntu)
  - [Install Other dependencies](#install-other-dependencies)
  - [Install newest version of git](#install-newest-version-of-git)
- [Linux (Ubuntu) Setup](#linux-ubuntu-setup)
  - [Install newest version of git](#install-newest-version-of-git)
<!--toc:end-->

## Overview
This config is base on 💤 LazyVim

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.


## MacOS Setup
1. Clone Config
```
git clone https://github.com/micah-svenson/neovim-config.git ~/.config/nvim
```
2. Install Neovim
```
brew install neovim
```
3. Install Ripgrep
```
brew install ripgrep
```
4. Install delta (pretty git diffs)
```
brew install git-delta
```
5. Install newest version of git
```
brew install git

```
6. Install lazygit
```
brew install lazygit
```

## Linux (Ubuntu) Setup

1. Clone Config
```
git clone https://github.com/micah-svenson/neovim-config.git ~/.config/nvim
```

2. Install Neovim
  - Install the latest stable release from their github repo. Package managers usually have much older versions, which is not recommended.
    ```
    curl --output-dir ~/downloads/nvim --create-dirs -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm -rf ~/downloads/nvim
    ```
3. Install Ripgrep
  - ```sudo apt install ripgrep```

4. Install delta (preety git diffs)
  - Add git config file according to: https://dandavison.github.io/delta/configuration.html
    ```
    curl -LO https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
    dpkg -i git-delta_0.18.2_amd64.deb
    - fd-find: sudo apt install fd-find
    ```
5. Install newest version of git
  ```
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt update && sudo apt upgrade
  sudo apt install git
  ```
6. 

