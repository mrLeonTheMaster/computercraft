print("Installing Basalt...")
local request = http.get("https://raw.githubusercontent.com/Pyroxenium/Basalt2/refs/heads/main/release/basalt-full.lua")
if not request then
  error("Failed to download Basalt Full")
end
local file = fs.open("basalt.lua", "w")
file.write(request.readAll())
file.close()
request.close()
print("Basalt installed successfully!")
