# conf

Pretty much all the programs and configurations that I use on my Linux system.

## Common software

[Bitwarden](https://flathub.org/apps/details/com.bitwarden.desktop)

## OS Specific

- [Guide 1](https://itsfoss.com/things-to-do-after-installing-fedora/)
- [Guide 2](https://fosspost.org/things-to-do-after-installing-fedora-37/)

## GNOME Extensions

- [Blur My Shell](https://extensions.gnome.org/extension/3193/blur-my-shell/)
- [OpenWeather](https://extensions.gnome.org/extension/750/openweather/)

## Fira Code

[Linux instructions](https://github.com/tonsky/FiraCode/wiki/Linux-instructions)

Through dnf
```bash
$ dnf install fira-code-fonts
```

## Kitty

[Binary installing](https://sw.kovidgoyal.net/kitty/binary/#binary-install)

Through dnf
```bash
$ dnf install kitty
```

[Configuring Kitty](https://sw.kovidgoyal.net/kitty/conf/#)

[My config](https://github.com/itsksrof/conf/blob/master/kitty)

## ZSH & Oh-My-Zsh

Through dnf
```bash
$ dnf install zsh
```

Make zsh your default shell
```bash
$ chsh -s $(which zsh)
```

[Oh-My-Zsh Install](https://ohmyz.sh/#install)

Using curl
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Theme: [Lambda Gitster](https://github.com/ergenekonyigit/lambda-gitster)

Plugins:
- [zsh-z](https://github.com/agkozak/zsh-z)
- [jsontools](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/jsontools)
- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
- [history](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/history)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [fzf](https://github.com/junegunn/fzf)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-shift-select](https://github.com/jirutka/zsh-shift-select)

[.zshrc](https://github.com/itsksrof/conf/blob/master/.zshrc)

## Neovim

[Neovim from package](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-package)

Through dnf
```bash
$ dnf copr enable agriffis/neovim-nightly
$ dnf install neovim python3-neovim
```
Theme: [rose-pine](https://github.com/rose-pine/neovim)

Plugins:
- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [fugitive.vim](https://github.com/tpope/vim-fugitive)
- [lsp-zero](https://github.com/VonHeikemen/lsp-zero.nvim)

[My config](https://github.com/itsksrof/conf/tree/master/nvim)

## Ulauncher

Through dnf
```bash
$ dnf install ulauncher
```

Wayland fix: [Hotkey in Wayland](https://github.com/Ulauncher/Ulauncher/wiki/Hotkey-In-Wayland)
