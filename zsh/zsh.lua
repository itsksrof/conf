-- Install the util-linux package. This package provides an utility called chsh
-- which will be used to change the user shell.
-- 
-- TODO: Improve this to find if the package is installed
function install_util_linux()
    os.execute("sudo dnf install util-linux")
end

-- Check if zsh is installed, if not install it.
function install_zsh()
    if os.execute("zsh") == nil then
        os.execute("sudo dnf install zsh")
    end
end

-- Set zsh as the default shell for the user.
function default_zsh()
    os.execute("chsh -s $(which zsh)")
end

-- Check if oh-my-zsh is installed, if not install it.
function install_omz(url)
    if os.execute("omz") == nil then
        os.execute(string.format('sh -c "$(curl -fsSL %s)"', url))
    end
end

-- Install oh-my-zsh plugins.
function install_plugins(plugins)
    for _, value in ipairs(plugins) do
        os.execute(string.format("git clone %s", value))
    end
end

-- Install oh-my-zsh themes.
function install_themes(themes, dest)
    for _, value in ipairs(themes) do
        os.execute(string.format("git clone %s %s", value, dest))
    end
end

-- Copy the installed oh-my-zsh themes to dest folder.
function copy_themes(sources, dest)
    for _, value in ipairs(sources) do
        os.execute(
            string.format("cp %s/%s %s", value,
            string.format("%s.zsh-theme", value), dest)
        )
    end
end

-- Check if there is already a .zshrc file in the system, if there is remove it.
-- Then copy the .zshrc file from src to dest.
function copy_config(src, dest)
    if io.open(dest) ~= nil then
        os.remove(dest)
    else
        os.execute(string.format("cp %s %s", src, dest))
    end
end
