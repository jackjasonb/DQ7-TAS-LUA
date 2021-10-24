require "./src/utils"

START_FRAME = 248051
STOP_FRAME = 332210

local function start(frame)
    if frame == START_FRAME then
        return false
    end
    return true
end

local function stop(frame)
    if frame == STOP_FRAME+1 then
        return false
    end
    return true
end

local function mainloop()
    console.log("start frame: " .. START_FRAME)
    console.log("stop frame: " .. STOP_FRAME)
    local frame = emu.framecount()

    client.pause_av()
    
    while start(frame) do
        emu.frameadvance()
        frame = emu.framecount()
    end

    client.unpause_av()

    local file = io.open("movie.csv", "w")
    console.log("file open")
    client.pause()
    console.log("Please check AVI/WAV Record.\nIf already recording, be unpoused")
    while stop(frame) do
        -- get values
        local time = getTime()
        local r_number = getRNum()
        local pos_x = getPosX()
        local pos_z = getPosZ()
        local encount_walk = getEncountWalk()
        local gold = get_gold()
        local battle_turn = get_turn_now()
        local enemy_name_1 = get_enemy_name(1)
        local enemy_hp_1 = get_enemy_HP(1)
        local enemy_name_2 = get_enemy_name(2)
        local enemy_hp_2 = get_enemy_HP(2)
        local enemy_name_3 = get_enemy_name(3)
        local enemy_hp_3 = get_enemy_HP(3)
        local enemy_name_4 = get_enemy_name(4)
        local enemy_hp_4 = get_enemy_HP(4)
        local player1_exp = get_exp(ADDRESS["ARUS_EXP"])
        local player2_exp = get_exp(ADDRESS["KIEFER_EXP"])
        local player3_exp = get_exp(ADDRESS["MARIBEL_EXP"])
        local player1_lv = get_player_lv(ADDRESS["ARUS_LV"])
        local player2_lv = get_player_lv(ADDRESS["KIEFER_LV"])
        local player3_lv = get_player_lv(ADDRESS["MARIBEL_LV"])

        -- write row
        file:write(frame .. "," .. time .. "," .. r_number .. "," .. pos_x .. "," .. pos_z .. "," .. 
                   encount_walk .. "," .. gold .. "," .. battle_turn .. "," .. 
                   enemy_name_1 .. "," .. enemy_hp_1 .. "," .. enemy_name_2 .. "," .. enemy_hp_2 .. "," .. 
                   enemy_name_3 .. "," .. enemy_hp_3 .. "," .. enemy_name_4 .. "," .. enemy_hp_4 .. "," .. 
                   player1_exp .. "," .. player2_exp .. "," .. player3_exp .. "," .. 
                   player1_lv .. "," .. player2_lv .. "," .. player3_lv .. "\n")

        -- next step
        emu.frameadvance()
        frame = emu.framecount()
    end
    file:close()
    console.log("file close")
    client.pause()
end

mainloop()
