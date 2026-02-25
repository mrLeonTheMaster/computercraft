local main = require("main")
local auth = require("lib/auth")
local auth_server = 16

term_w, term_h = term.getSize()
term.clear()
term.setCursorPos((term_w/2)-5, term_h/2)
term.write("Uruchamianie...")
pcall(auth.auth, main.main, term_w, term_h, auth_server)
os.reboot()
