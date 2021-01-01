-- written by jackjasonb

ADDRESS = {
    R_NUM = 0x0F9BA0,
    POS_X = 0x0C7020,
    POS_Z = 0x0C7028,
    ENCOUNT_WALK = 0x0F78DC,
    MAP_ID = 0x0F74D4,
    CAMERA = 0x0DB498,
    ENEMY_1_HP = 0x0E5BBA,
    ENEMY_2_HP = 0x0E5C66,
    ENEMY_3_HP = 0x0E5D12,
    ENEMY_4_HP = 0x0E5DBE
}

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

function getEnemy1HP()
    return memory.read_u16_le(ADDRESS.ENEMY_1_HP)
end

function getEnemy2HP()
    return memory.read_u16_le(ADDRESS.ENEMY_2_HP)
end

function getEnemy3HP()
    return memory.read_u16_le(ADDRESS.ENEMY_3_HP)
end

function getEnemy4HP()
    return memory.read_u16_le(ADDRESS.ENEMY_4_HP)
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

    time = string.format("%2d:%2d:%2d:%2d", hour, min, sec, msec)
    return time
end
