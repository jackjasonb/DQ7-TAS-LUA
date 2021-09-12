require "gui"

function main()
    GUI.label_width = 27 * 2
    GUI.button_height = 18 * 2
    GUI.initGUI()
    event.onframeend(mainloop)
    while true do
        emu.frameadvance()
    end
end

main()
