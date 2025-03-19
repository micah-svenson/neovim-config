## Overview
This config is base on 💤 LazyVim

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.


## Installation

### Clone Config

Clone this repository to `~/.config/` and name the config repo `nvim`

```shell
cd ~/.config/

git clone https://github.com/micah-svenson/neovim-config.git nvim
```

### Install Neovim

Install the latest stable release from their github repo. Package managers usually have much older versions, which is not recommended.

```
curl --output-dir ~/downloads/nvim --create-dirs -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
rm -rf ~/downloads/nvim
```

### Install Package Manager (Lazy.nvim)

- https://lazy.folke.io/installation

### Install Other dependencies
- Ripgrep
- Delta diff (pretty git diffs)
  - Add git config file according to: https://dandavison.github.io/delta/configuration.html
```
curl -LO https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
dpkg -i git-delta_0.18.2_amd64.deb
- fd-find: sudo apt install fd-find
```

### Install newest version of git 
```
sudo add-apt-repository ppa:git-core/ppa
sudo apt update && sudo apt upgrade
```
```
```
