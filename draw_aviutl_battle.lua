CSV_PATH = ".\\script\\battle.csv"

local function split(str, d)
    local s = str
    local t = {}
    local p = "%s*(.-)%s*" .. d .. "%s*"
    local f = function(v)
        table.insert(t, v)
    end

    if s ~= nil then
        string.gsub(s, p, f)
        f(string.gsub(s, p, ""))
    end
    return t
end

function main()
    local csv_row = {}
    local row_num = 0

    for line in io.lines(CSV_PATH) do
        csv_row[row_num] = line
        row_num = row_num + 1
    end

    local row = split(csv_row[obj.frame], ",")
    local battle_turn = row[8]
    local enemy_name_1 = row[9]
    local enemy_hp_1 = row[10]

    local text = "Turn: " .. battle_turn .. "\n" .. enemy_name_1 .. "  HP: " .. enemy_hp_1
    obj.mes(text)
end

main()
