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
local frame = string.format("%7d", row[1])
local time = row[2]
local r_num = string.format("%8s", row[3])
local pos_x = string.format("%5d", tonumber(row[4]))
local pos_z = string.format("%5d", tonumber(row[5]))
local encount_walk = string.format("%6d", tonumber(row[6]))
local text = "Frame: " .. frame .. "\nTime: " .. time .. "\nR_NUM: " .. r_num
local position = "\nX: " .. pos_x .. "  Z: " .. pos_z
local enc = "\nEnc_Walk: " .. encount_walk
obj.mes(text .. position .. enc)
