-- Create the directory from where ulauncher themes will be loaded.
function CreateUlauncherThemesDir(path)
    os.execute(string.format("mkdir -p %s", path))
end

-- Install the given ulauncher themes in the themes folder.
function InstallUlauncherThemes(themes, dest)
    for _, value in ipairs(themes) do
        os.execute(string.format("git clone %s %s", value, dest))
    end
end
