require "utils"

START_FRAME = 1000
STOP_FRAME = 100000

local function start(frame)
    if frame == START_FRAME then
        return false
    end
    return true
end

local function stop(frame)
    if frame == STOP_FRAME then
        return false
    end
    return true
end

local function mainloop()
    console.log("start frame: " .. START_FRAME)
    console.log("stop frame: " .. STOP_FRAME)
    local frame = emu.framecount()

    while start(frame) do
        frame = emu.framecount()
        emu.frameadvance()
    end

    local file = io.open("movie.csv", "w")
    console.log("file open")
    while stop(frame) do
        frame = emu.framecount()
        local time = getTime()
        local r_number = getRNum()
        local pos_x = getPosX()
        local pos_z = getPosZ()
        file:write(frame .. "," .. time .. "," .. r_number .. "," .. pos_x .. "," .. pos_z .. "\n")
        emu.frameadvance()
    end
    file:close()
    console.log("file close")
end

mainloop()
