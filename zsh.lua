-- Set zsh as the default shell for the user.
function ChangeShell()
    os.execute("chsh -s $(which zsh)")
end

-- Check if oh-my-zsh is installed, if not install it.
function InstallOMZ(url)
    if os.execute("omz") == nil then
        os.execute(string.format('sh -c "$(curl -fsSL %s)"', url))
    end
end

-- Install oh-my-zsh plugins.
function InstallPlugins(plugins)
    for _, value in ipairs(plugins) do
        os.execute(string.format("git clone https://github.com/%s", value))
    end
end

-- Install oh-my-zsh themes.
function InstallThemes(themes, dest)
    for _, value in ipairs(themes) do
        os.execute(string.format("git clone https://github.com/%s %s", value, dest))
    end
end

-- Copy the installed oh-my-zsh themes to dest folder.
function CopyThemes(sources, dest)
    for _, value in ipairs(sources) do
        os.execute(
            string.format("cp %s/%s %s", value,
            string.format("%s.zsh-theme", value), dest)
        )
    end
end

-- Check if there is already a .zshrc file in the system, if there is remove it.
-- Then copy the .zshrc file from src to dest.
function CopyConfig(src, dest)
    if io.open(dest) ~= nil then
        os.remove(dest)
    else
        os.execute(string.format("cp %s %s", src, dest))
    end
end
