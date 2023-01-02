--[[
===============================================================================
SYSTEM
===============================================================================
--]]

function SetupSystem()
    local hostname = "highlandpark"
    local rpm_free = "free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    local rpm_nonfree = "nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
    local copr_repos = {"kwizart/fedy", "agriffis/neovim-nightly"}
    local dnf_packages = {
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
        "fzf",
    }

    -- Update system packages.
    os.execute("sudo dnf update")

    -- Set system hostname
    os.execute(string.format("sudo hostnamectl set-hostname %s", hostname))

    -- Enable rpm free and non-free repo.
    os.execute(string.format("sudo rpm -Uvh %s", rpm_free))
    os.execute(string.format("sudo rpm -Uvh %s", rpm_nonfree))

    -- Install media codecs.
    os.execute([[
    sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base}
    gstreamer1-plugin-openh264 gstreamer1-libav
    --exclude=gstreamer1-plugins-bad-free-devel
    ]])
    os.execute([[sudo dnf install lame\* --exclude=lame-devel]])
    os.execute("sudo dnf group upgrade --with-optional Multimedia")

    -- Enable fedora copr repos.
    for _, value in ipairs(copr_repos) do
        os.execute(string.format("sudo dnf copr enable %s", value))
    end

    -- Install dnf packages.
    for _, value in ipairs(dnf_packages) do
        os.execute(string.format("sudo dnf install %s", value))
    end
end

-- Run SetupSystem
SetupSystem()

--[[
===============================================================================
NODE VERSION MANAGER
===============================================================================
--]]

function SetupNVM()
    local nvm = "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh"

    -- Install the node version manager.
    os.execute(string.format("curl -o- %s | bash", nvm))

    -- Source .bashrc to enable the nvm command.
    os.execute("source ~/.bashrc")

    -- Install the LTS version of node using nvm.
    os.execute("nvm install --lts")
end

-- Run SetupNVM
SetupNVM()

--[[
===============================================================================
GOLANG VERSION MANAGER
===============================================================================
--]]

function SetupGVM()
    local gvm = "https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer"
    local go_version = "go1.19.4"

    -- Install the golang version manager.
    os.execute(string.format("bash < <(curl -s -S -L %s)", gvm))

    -- Source gvm to enable the gvm command.
    os.execute("source ~/.gvm/scripts/gvm")

    -- Install go1.4 binary which is required to install further go versions.
    os.execute("gvm install go1.4 -B")

    -- Use go1.4 in this session.
    os.execute("gvm use go1.4")

    -- Install the desired go version and set it as default.
    os.execute(string.format("gvm install %s --default", go_version))
end

-- Run SetupGVM
SetupGVM()

--[[
===============================================================================
FLATHUB
===============================================================================
--]]

function SetupFlathub()
    local flathub = "https://flathub.org/repo/flathub.flatpakrepo"
    local flathub_packages = {
        "com.bitwarden.dekstop",
        "com.slack.Slack",
        "io.dbeaver.DBeaverCommunity",
        "org.flameshot.Flameshot",
        "rest.insomnia.Insomnia"
    }

    -- Enable flathub repository in flatpak.
    os.execute(string.format("flatpak remote-add --if-not-exists flathub %s", flathub))

    -- Install flathub packages.
    for _, value in ipairs(flathub_packages) do
        os.execute(string.format("flatpak install flathub %s", value))
    end
end

-- Run SetupFlathub
SetupFlathub()

--[[
===============================================================================
SHELL
===============================================================================
--]]

function SetupShell()
    local omz = "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
    local zsh_plugins = {
        "agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z",
        "zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting",
        "zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions",
        "jirutka/zsh-shift-select.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-shift-select"
    }

    -- Sets zsh as the default user shell.
    os.execute("chsh -s $(which zsh)")

    -- Install the oh-my-zsh framework.
    os.execute(string.format([[sh -c "$(curl -fsSL %s)"]], omz))

    -- Install plugins for the shell.
    for _, value in ipairs(zsh_plugins) do
        os.execute(string.format("git clone https://github.com/%s", value))
    end

    -- Copy zsh themes.
    os.execute("cp -a ./zsh/themes/ ~/.oh-my-zsh/custom/themes/")

    -- Copy zsh config.
    os.execute("cp ./zsh/.zshrc ~/")
end

-- Run SetupShell
SetupShell()

--[[
===============================================================================
KITTY
===============================================================================
--]]

function SetupKitty()
    -- Copy the kitty directory.
    os.execute("cp -r ./kitty/ ~/.config/")
end

-- Run SetupKitty
SetupKitty()

--[[
===============================================================================
NEOVIM
===============================================================================
--]]

function SetupNeovim()
    -- Copy the neovim directory.
    os.execute("cp -r ./nvim/ ~/.config/")
end

-- Run SetupNeovim
SetupNeovim()

--[[
===============================================================================
ULAUNCHER
===============================================================================
--]]

function SetupUlauncher()
    -- Copy the ulauncher themes directory.
    os.execute("cp -r ./ulauncher/user-themes/ ~/.config/ulauncher/")
end

-- Run SetupUlauncher
SetupUlauncher()
