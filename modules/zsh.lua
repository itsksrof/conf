-- Set zsh as the default shell for the user.
function ChangeShell() os.execute("chsh -s $(which zsh)") end

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
