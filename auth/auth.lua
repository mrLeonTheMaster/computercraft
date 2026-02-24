local function auth(main_function)
    term_w, term_h = term.getSize()
    while true do
        term.setTextColor(colors.white)
        term.clear()
        term.setCursorPos((term_w/2)-10, term_h-1)
        term.write("Podaj pin: ")
        entered_pin = read("*")
        if entered_pin == "1111" then
            pcall(main_function, "test1")
        elseif entered_pin == "2222" then
            pcall(main_function, "test2")
        elseif entered_pin ~= "" then
            term.setTextColor(colors.red)
            term.clear()
            term.setCursorPos((term_w/2)-5, term_h/2)
            term.write("Bledny pin!")
            sleep(3)
        end
    end
end
