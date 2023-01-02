-- Install golang version manager.
function InstallGVM(url)
    os.execute(string.format("bash < <(curl -s -S -L %s)", url))
    os.execute("source ~/.gvm/scripts/gvm")
end

-- Install go1.4 binary version (required to install further go versions).
function InstallGoBinary()
    os.execute("gvm install go1.4 -B")
    os.execute("gvm use go1.4")
end

-- Install the given golang version using the golang version manager.
function InstallGoVersion(version, default)
    if default == true then
        os.execute(string.format("gvm install %s --default", version))
    else
        os.execute(string.format("gvm install %s", version))
    end
end
