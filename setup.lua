require("system")
require("nvm")
require("gvm")
require("flathub")
require("zsh")
require("kitty")
require("neovim")
require("ulauncher")

--[[
===============================================================================
SYSTEM
===============================================================================
--]]

-- Update system packages.
UpdatePackages()

-- Set system hostname
SetHostname("highlandpark")

-- Enable rpm free and non-free repo.
EnableRPM("https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm")
EnableRPM("https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm")

-- Install media codecs.
InstallMediaCodecs()

-- Enable fedora copr repos.
EnableCoprRepositories({
    "kwizart/fedy",
    "agriffis/neovim-nightly",
})

-- Install the provided packages.
InstallPackages({
    "vlc",
    "gnome-tweaks",
    "gnome-extension-app",
    "util-linux",
    "zsh",
    "kitty",
    "fira-code-fonts",
    "fedy",
    "neovim",
    "python3-neovim",
    "bison",
    "ulauncher",
})

--[[
===============================================================================
NODE VERSION MANAGER
===============================================================================
--]]

-- Install nvm.
InstallNVM("https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh")

-- Install the LTS node version.
InstallNodeLTS()

--[[
===============================================================================
GOLANG VERSION MANAGER
===============================================================================
--]]

-- Install gvm.
InstallGVM("https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer")

-- Install go1.4 binary.
InstallGoBinary()

-- Install the given go version.
InstallGoVersion("go1.19.4", true)

--[[
===============================================================================
FLATHUB
===============================================================================
--]]

-- Enable flathub repository in flatpak.
EnableFlathub("https://flathub.org/repo/flathub.flatpakrepo")

-- Install the provided flatpak packages.
InstallFlatpaks({
    "com.bitwarden.dekstop",
    "com.slack.Slack",
    "io.dbeaver.DBeaverCommunity",
    "org.flameshot.Flameshot",
    "rest.insomnia.Insomnia",
})

--[[
===============================================================================
ZSH & OH-MY-ZSH
===============================================================================
--]]

-- Sets zsh as default user shell.
ChangeShell()

-- Install oh-my-zsh.
InstallOMZ("https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")

-- Install oh-my-zsh plugins.
InstallPlugins({
    "agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z",
    "zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting",
    "zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions",
    "jirutka/zsh-shift-select.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-shift-select",
})

-- Install oh-my-zsh themes.
InstallThemes({
    "ergenekonyigit/lambda-gitster.git",
}, "~/")

-- Copy oh-my-zsh themes.
CopyThemes({
    "~/lambda-gitster",
}, "~/.oh-my-zsh/custom/themes/")

-- Copy zsh config.
CopyConfig("./.zshrc", "~/.zshrc")

--[[
===============================================================================
KITTY
===============================================================================
--]]

-- Create kitty configuration dir.
CreateKittyDir("~/.config/kitty/")

-- Copy kitty .conf files.
CopyConfFiles({
    "./kitty/kitty.conf",
    "./kitty/current-theme.conf",
}, "~/.config/kitty/")

--[[
===============================================================================
NEOVIM
===============================================================================
--]]

-- Copy neovim config dir to system.
CopyNeovimDir("./nvim/", "~/.config/")

--[[
===============================================================================
ULAUNCHER
===============================================================================
--]]

-- Create ulauncher themes dir.
CreateUlauncherThemesDir("~/.config/ulauncher/user-themes/")

-- Install the given ulauncher themes.
InstallUlauncherThemes({
    "git@github.com:kalenpw/transparent-adwaita.git",
}, "~/.config/ulauncher/user-themes/")
