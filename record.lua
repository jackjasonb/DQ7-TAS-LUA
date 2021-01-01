require "utils"

STOP_FRAME = 100

local function stop(frame)
    if frame + 1 == STOP_FRAME then
        return false
    end
    return true
end

local function mainloop()
    console.log(STOP_FRAME)
    local file = io.open("movie.csv", "w")
    local frame = 0
    while stop(frame) do
        frame = emu.framecount()
        local time = getTime()
        local r_number = getRNum()
        file:write(frame .. "," .. time .. "," .. r_number .. "\n")
        emu.frameadvance()
    end
    file:close()
end

mainloop()
