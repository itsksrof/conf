-- Install node version manager.
function InstallNVM(url)
    os.execute(string.format("curl -o- %s | bash", url))
    os.execute("source ~/.bashrc")
end

-- Install the LTS node version using the node version manager.
function InstallNodeLTS()
    os.execute("nvm install --lts")
end
