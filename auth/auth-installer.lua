local function download(file_name, url)
    print("Downloading " .. file_name .. "...")
    local request = http.get(url)
    if not request then
      error("Failed to download " .. file_name)
    end
    local file = fs.open(file_name, "w")
    file.write(request.readAll())
    file.close()
    request.close()
    print("Downloaded " .. file_name)
end

download("lib/basalt.lua", "https://raw.githubusercontent.com/Pyroxenium/Basalt2/refs/heads/main/release/basalt-full.lua")
download("lib/auth.lua", "https://raw.githubusercontent.com/mrLeonTheMaster/computercraft/refs/heads/main/auth/auth.lua")
download("lib/bigfont.lua", "https://pastebin.com/raw/3LfWxRWh")
download("startup.lua", "https://raw.githubusercontent.com/mrLeonTheMaster/computercraft/refs/heads/main/auth/startup.lua")
