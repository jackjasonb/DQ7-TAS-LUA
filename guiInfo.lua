require "gui"

function main()
    GUI.label_width = 27
    GUI.button_height = 18
    GUI.initGUI()
    event.onframeend(mainloop)
    while true do
        emu.frameadvance()
    end
end

main()