-- written by jackjasonb

-- rootからの相対パス
require "./src/item"
require "./src/monster"

ADDRESS = {
    R_NUM = 0x0F9BA0,
    -- 移動関係
    POS_X = 0x0C7020,
    POS_Z = 0x0C7028,
    ENCOUNT_WALK = 0x0F78DC,
    MAP_ID = 0x0F74D4,
    CAMERA = 0x0DB498,
    -- 戦闘関係
    TURN = 0x0E75DC,
    ENEMY_1_HP = 0x0E5BBA,
    ENEMY_2_HP = 0x0E5C66,
    ENEMY_3_HP = 0x0E5D12,
    ENEMY_4_HP = 0x0E5DBE,
    ENEMY_5_HP = 0x0E5E6A,
    ENEMY_1_NAME = 0x0E72F0,
    ENEMY_2_NAME = 0x0E72F4,
    ENEMY_3_NAME = 0x0E72F8,
    ENEMY_4_NAME = 0x0E72FC,
    ENEMY_1_NUM = 0x0E72F2,
    ENEMY_2_NUM = 0x0E72F6,
    ENEMY_3_NUM = 0x0E72FA,
    ENEMY_4_NUM = 0x0E72FE,
    -- 道具関係
    ARUS_ITEM_1 = 0x010C48,
    KIEFER_ITEM_1 = 0x010D54,
    MARIBEL_ITEM_1 = 0x010E60,
    GABO_ITEM_1 = 0x010F6C,
    MELVIN_ITEM_1 = 0x011184,
    AIRA_ITEM_1 = 0x011078,
    GOLD1 = 0x0112D8,
    GOLD2 = 0x0112DA,
    -- 経験値
    ARUS_EXP = 0x010c6c,
    KIEFER_EXP = 0x010d78,
    MARIBEL_EXP = 0x010e84,
    GABO_EXP = 0x010f90,
    MELVIN_EXP = 0x0111a8,
    AIRA_EXP = 0x01109c,
    -- HP
    ARUS_HP = 0x010c7a,
    KIEFER_HP = 0x010d86,
    MARIBEL_HP = 0x010e92,
    GABO_HP = 0x010f9e,
    MELVIN_HP = 0x0111b6,
    AIRA_HP = 0x0110aa,
    -- MP
    ARUS_MP = 0x010c7c,
    KIEFER_MP = 0x010d88,
    MARIBEL_MP = 0x010e94,
    GABO_MP = 0x010fa0,
    MELVIN_MP = 0x0111b8,
    AIRA_MP = 0x0110ac,
    -- レベル
    ARUS_LV = 0x010c6a,
    KIEFER_LV = 0x010d76,
    MARIBEL_LV = 0x010e82,
    GABO_LV = 0x010f8e,
    MELVIN_LV = 0x0111a6,
    AIRA_LV = 0x01109a,
}

PLAYER = {"Arus", "Kiefer", "Maribel", "Gabo", "Melvin", "Aira"}

function dec2hex(input)
    return string.format("%04x", input)
end

function table2str(table)
    local table_str = ""
    for i = 1, #table do
        table_str = table_str .. table[i] .. "\n"
    end
    return table_str
end

function getRNum()
    return string.format("%x", memory.read_u32_le(ADDRESS.R_NUM))
end

function getPosX()
    return memory.read_s32_le(ADDRESS.POS_X)
end

function getPosZ()
    return memory.read_s32_le(ADDRESS.POS_Z)
end

function getEncountWalk()
    return memory.read_u16_le(ADDRESS.ENCOUNT_WALK)
end

function getMapId()
    return memory.read_u32_le(ADDRESS.MAP_ID)
end

function getCamera()
    return memory.read_u32_le(ADDRESS.CAMERA)
end

function getTime()
    frame = emu.framecount()
    --hour
    hour = math.floor(frame / (60 * 60 * 60))
    frame = frame - hour * (60 * 60 * 60)
    --min
    min = math.floor(frame / (60 * 60))
    frame = frame - min * (60 * 60)
    --sec
    sec = math.floor(frame / 60)
    frame = frame - sec * 60
    --msec
    msec = math.floor(frame / 60 * 100)

    time = string.format("%02d:%02d:%02d.%02d", hour, min, sec, msec)
    return time
end

function get_items(address)
    local items = {}
    local equip = false
    for i = 0, 11 do
        local item = memory.read_u16_le(address + i * 2)
        -- アイテム装備時はアイテムの値に0x0400が加算される
        if item > 1024 then
            item = item - 1024
            equip = true
        end
        item = "i" .. string.format("%04X", item)
        if equip then
            table.insert(items, "E:" .. ITEM[item])
        else
            table.insert(items, "  " .. ITEM[item])
        end
        equip = false
    end
    return items
end

function get_gold()
    return memory.read_u32_le(ADDRESS.GOLD1)
end

function get_enemy_name(num)
    local enemy_num_addresses ={
        ADDRESS.ENEMY_1_NUM,
        ADDRESS.ENEMY_2_NUM,
        ADDRESS.ENEMY_3_NUM,
        ADDRESS.ENEMY_4_NUM
    }
    local enemy_name_addresses ={
        ADDRESS.ENEMY_1_NAME,
        ADDRESS.ENEMY_2_NAME,
        ADDRESS.ENEMY_3_NAME,
        ADDRESS.ENEMY_4_NAME
    }
    local enemy =""
    local all_enemy_num = get_all_enemy_num()
    if num > all_enemy_num then
        return enemy
    end

    local i = 1
    local enemy_num = 0
    while num>0 do
        enemy = MONSTER["m" .. string.format("%04X", memory.read_u16_le(enemy_name_addresses[i]))]
        enemy_num = memory.read_u16_le(enemy_num_addresses[i])
        num = num - enemy_num
        i = i + 1
    end
    return enemy
end

function get_all_enemy_num()
    local enemy_num_addresses ={
        ADDRESS.ENEMY_1_NUM,
        ADDRESS.ENEMY_2_NUM,
        ADDRESS.ENEMY_3_NUM,
        ADDRESS.ENEMY_4_NUM
    }
    num = 0
    for i=1,4 do
        num = num + memory.read_u16_le(enemy_num_addresses[i])
    end
    return num
end 

function get_enemy_HP(num)
    local all_enemy_num = get_all_enemy_num()
    if num > all_enemy_num then
        return ""
    end
    local enemy_hp_addresses ={
        ADDRESS.ENEMY_1_HP,
        ADDRESS.ENEMY_2_HP,
        ADDRESS.ENEMY_3_HP,
        ADDRESS.ENEMY_4_HP
    }
    hp = memory.read_u16_le(enemy_hp_addresses[num])
    if hp == 65000 and num == 1 then
        hp = memory.read_u16_le(enemy_hp_addresses[num + 1])
    end
    return hp
end

function get_exp(address)
    return memory.read_u32_le(address)
end

function get_turn_now()
    return memory.read_u16_le(ADDRESS.TURN) +  1
end

function get_player_hp(address)
    return math.floor(memory.read_u16_le(address) / 16)
end

function get_player_mp(address)
    local value = memory.read_u16_le(address)
    -- 上から2桁目を抽出
    local up2 = math.floor(value / (16 ^ 2)) % 16 % 4
    return (value % (16^2)) + (up2 * (16 ^ 2))
end

function get_player_lv(address)
    return math.floor(memory.read_u16_le(address) / 16) / 2
end
