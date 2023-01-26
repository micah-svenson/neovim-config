## Overview

A customized neovim experience meant to replace the need for a modern IDE.

For a full explainer and cheatsheet, see my blog post [Neovim as an IDE Replacement]()


## Installation

Clone this repository to `~/.config/` and name the config repo `nvim`

```shell
cd ~/.config/

git clone https://github.com/micah-svenson/neovim-config.git nvim
```

Open nvim and install plugin config
```shell
nvim ~/.config/nvim/lua/micah/packer.lua

# In normal mode command prompt
:PackerSync
```

