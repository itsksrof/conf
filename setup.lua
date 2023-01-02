require("zsh.zsh")

-- Provides chsh.
InstallUtilLinux()

-- Provides zsh.
InstallZsh()

-- Sets zsh as default user shell.
DefaultZsh()

-- Installs oh-my-zsh.
InstallOhMyZsh("https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")

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
