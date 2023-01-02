-- Copy the kitty config folder from the repository to the system.
function CopyKittyDir(src, dest)
    os.execute(string.format("cp -r %s %s", src, dest))
end
