require "utils"

local items = get_items(ADDRESS.ARUS_ITEM_1)
for i = 0, #items do
    print(items[i])
end
