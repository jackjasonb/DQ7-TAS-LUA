CSV_PATH = ".\\script\\movie.csv"

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

local csv_row = {}
local row_num = 0
for line in io.lines(CSV_PATH) do
    csv_row[row_num] = line
    row_num = row_num + 1
end
local row = split(csv_row[obj.frame], ",")
local player1_lv = string.format("%2d", tonumber(row[20]))
local player1_exp = string.format("%4d", tonumber(row[17]))
local diff = 1356 - tonumber(row[17])
local text = "Lv." .. player1_lv .. "\nExp: " .. player1_exp .. "\n   : " .. diff
obj.mes(text)

