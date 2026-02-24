local main = require("main.main")
local auth = require("auth.auth")
pcall(auth, main)
os.reboot()
