local function auth(main_function, term_w, term_h, auth_server)
    local BigFont = require("lib/bigfont")
    rednet.open("back")
    while true do
        term.clear()
        term.setTextColor(colors.green)
        term.setCursorPos((term_w/2)-12, 2)
        BigFont.bigWrite("Logowanie")
        term.setTextColor(colors.white)
        term.setCursorPos((term_w/2)-10, term_h-1)
        term.write("Podaj pin: ")
        entered_pin = read("*")
        if entered_pin ~= "" then
            term.setCursorPos((term_w/2)-4, term_h/2)
            term.write("Czekaj...")
            local message = {}
            message["type"] = "pin"
            message["pin"] = entered_pin
            rednet.send(auth_server, message)
            local reply_id, reply
            repeat
                reply_id, reply = rednet.receive(nil, 5)
                if not reply_id then
                    print("Blad uwierzytelnienia!")
                    sleep(3)
                    os.reboot()
                end
            until reply_id == auth_server

            if reply["success"] then
                term.clear()
                term.setCursorPos(1, 1)
                pcall(main_function, "test1")
                term.setTextColor(colors.green)
                term.clear()
                term.setCursorPos((term_w/2)-5, term_h/2)
                term.write("Wylogowano!")
                sleep(1)
            else
                term.setTextColor(colors.red)
                term.clear()
                term.setCursorPos((term_w/2)-5, term_h/2)
                term.write("Bledny pin!")
                sleep(3)
            end
        end
    end
end

return {auth=auth}
