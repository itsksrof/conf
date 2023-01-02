-- Enable flathub repository in flatpak.
function EnableFlathub(url)
    os.execute(string.format("flatpak remote-add --if-not-exists flathub %s", url))
end

-- Install the provided flatpak packages.
function InstallFlatpaks(packages)
    for _, value in ipairs(packages) do
        os.execute(string.format("flatpak install flathub %s", value))
    end
end
