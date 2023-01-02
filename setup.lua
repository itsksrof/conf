require("zsh.zsh")

-- Install and configure zsh and oh-my-zsh
install_util_linux()
install_zsh()
default_zsh()
install_omz("https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh")
install_plugins({
    "https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z",
    "https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting",
    "https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions",
    "https://github.com/jirutka/zsh-shift-select.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-shift-select",
})
install_themes({
    "https://github.com/ergenekonyigit/lambda-gitster.git",
}, "~/")
copy_themes({
    "~/lambda-gitster",
}, "~/.oh-my-zsh/custom/themes/")
copy_config("./.zshrc", "~/.zshrc")
