-- Update the packages that are installed in the system.
function UpdatePackages() os.execute("sudo dnf update") end

-- Set the system hostname.
function SetHostname(name)
    os.execute(string.format("sudo hostnamectl set-hostname %s", name))
end

-- Enable rpmfusion free and non-free repositories.
function EnableRPM(url) os.execute(string.format("sudo rpm -Uvh %s", url)) end

-- Install media codecs.
function InstallMediaCodecs()
    os.execute([[
        sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base}
        gstreamer1-plugin-openh264 gstreamer1-libav
        --exclude=gstreamer1-plugins-bad-free-devel
    ]])
    os.execute([[sudo dnf install lame\* --exclude=lame-devel]])
    os.execute("sudo dnf group upgrade --with-optional Multimedia")
end

-- Enable fedora copr repositories.
function EnableCoprRepositories(repos)
    for _, value in ipairs(repos) do
        os.execute(string.format("sudo dnf copr enable %s", value))
    end
end

-- Install the provided packages.
function InstallPackages(packages)
    for _, value in ipairs(packages) do
        os.execute(string.format("sudo dnf install %s", value))
    end
end
