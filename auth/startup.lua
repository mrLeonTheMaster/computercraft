local main = require("main")
local auth = require("auth")
pcall(auth.auth, main.main)
os.reboot()
