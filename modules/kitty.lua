-- Create the directory from where kitty .conf files will be loaded.
function CreateKittyDir(path)
    os.execute(string.format("mkdir %s", path))
end

-- Copy the .conf files from the repository to the system.
function CopyConfFiles(files, dest)
    for _, value in ipairs(files) do
        os.execute(string.format("cp %s %s", value, dest))
    end
end
