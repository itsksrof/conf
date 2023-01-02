-- Copy the neovim config folder from the repository to the system.
function CopyNeovimDir(src, dest)
    os.execute(string.format("cp -r %s %s", src, dest))
end
