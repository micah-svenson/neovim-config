# Overview

<!--toc:start-->
- [Overview](#overview)
  - [MacOS Setup](#macos-setup)
  - [Linux (Ubuntu) Setup](#linux-ubuntu-setup)
<!--toc:end-->

This config is base on 💤 LazyVim

Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## MacOS Setup

1. Clone Config

```shell
git clone https://github.com/micah-svenson/neovim-config.git ~/.config/nvim
```

1. Install Neovim

```shell
brew install neovim
```

1. Install Ripgrep

```shell
brew install ripgrep
```

1. Install delta (pretty git diffs)

```shell
brew install git-delta
```

1. Install newest version of git

```shell
brew install git

```

1. Install lazygit

```shell
brew install lazygit
```

Add the following to the lazygit config (access in the app with 1[status] then e)

```yaml
# Keybindings
keybinding:
  universal:
    confirmInEditor: <c-k>
# Config relating to git
git:
  # See https://github.com/jesseduffield/lazygit/blob/master/docs/Custom_Pagers.md
  paging:
    # Value of the --color arg in the git diff command. 
    # Some pagers want this to be set to 'always' and some want it set to 'never'
    colorArg: always
    pager: delta --dark --paging=never
```

1. Install fzf

```shell
brew install fzf
```

1. Install fd-find

```shell
brew install fd
```

## Linux (Ubuntu) Setup

1. Clone Config

```shell
git clone https://github.com/micah-svenson/neovim-config.git ~/.config/nvim
```

1. Install Neovim

- Install the latest stable release from their github repo.
  - Package managers usually have much older versions, which is not recommended.

    ```shell
    curl --output-dir ~/downloads/nvim --create-dirs -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm -rf ~/downloads/nvim
    ```

1. Install Ripgrep

- ```sudo apt install ripgrep```

1. Install delta (pretty git diffs)

 Add git config file according to: <https://dandavison.github.io/delta/configuration.html>

```shell
curl -LO https://github.com/dandavison/delta/releases/download/0.18.2/git-delta_0.18.2_amd64.deb
dpkg -i git-delta_0.18.2_amd64.deb
- fd-find: sudo apt install fd-find
  ```

1. Install newest version of git

  ```shell
  sudo add-apt-repository ppa:git-core/ppa
  sudo apt update && sudo apt upgrade
  sudo apt install git
  ```
