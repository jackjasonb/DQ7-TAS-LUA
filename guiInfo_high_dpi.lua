require "utils"

GUI = {
    form_controls = {},
    form_width = 32,
    form_height = 16,
    form_padding = 4,
    label_width = 27 * 2,
    button_height = 18 * 2
}

local function round(num, idp)
    return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function GUI:row(row_num)
    return round(self.form_padding + self.button_height * row_num, 0)
end

function GUI:col(col_num)
    return round(self.form_padding + self.label_width * col_num, 0)
end

function GUI:width(col_num)
    return round(self.label_width * col_num, 0)
end

function GUI:height(row_num)
    return round(self.button_height * row_num, 0)
end

function GUI:initGUI()
    FORM = forms.newform(GUI:col(GUI.form_width), GUI:row(GUI.form_height), "DQ7 Info")

    local blank = "undefined"
    local row = 0
    local left_form_width = GUI.form_width / 7
    -- random number
    GUI.form_controls["R Number Label"] =
        forms.label(FORM, "R_NUM: ", GUI:col(0), GUI:row(row), GUI:width(left_form_width / 2), GUI:height(1))
    GUI.form_controls["R Number Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width / 2),
        GUI:row(row),
        GUI:width(left_form_width / 2),
        GUI:height(1)
    )

    row = row + 2
    -- frame
    GUI.form_controls["Frame Label"] =
        forms.label(FORM, "Frame: ", GUI:col(0), GUI:row(row), GUI:width(left_form_width / 2), GUI:height(1))
    GUI.form_controls["Frame Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width / 2),
        GUI:row(row),
        GUI:width(left_form_width / 2),
        GUI:height(1)
    )

    row = row + 1
    -- time
    GUI.form_controls["Time Label"] =
        forms.label(FORM, "Time: ", GUI:col(0), GUI:row(row), GUI:width(left_form_width / 2), GUI:height(1))
    GUI.form_controls["Time Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width / 2),
        GUI:row(row),
        GUI:width(left_form_width / 2),
        GUI:height(1)
    )

    row = row + 2
    -- Position
    GUI.form_controls["X Label"] =
        forms.label(FORM, "X:", GUI:col(0), GUI:row(row), GUI:width(left_form_width / 8), GUI:height(1))
    GUI.form_controls["X Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width / 8),
        GUI:row(row),
        GUI:col(left_form_width / 4),
        GUI:height(1)
    )
    GUI.form_controls["Z Label"] =
        forms.label(
        FORM,
        "Z:",
        GUI:col(left_form_width * 3 / 8) + GUI.form_padding,
        GUI:row(row),
        GUI:width(left_form_width / 8),
        GUI:height(1)
    )
    GUI.form_controls["Z Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width * 1 / 2) + GUI.form_padding * 2,
        GUI:row(row),
        GUI:width(left_form_width / 4),
        GUI:height(1)
    )
    row = row + 1
    -- encount walk
    GUI.form_controls["Encount Label"] =
        forms.label(FORM, "Encount Walk: ", GUI:col(0), GUI:row(row), GUI:width(left_form_width / 2), GUI:height(1))
    GUI.form_controls["Encount Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width / 2),
        GUI:row(row),
        GUI:width(left_form_width / 2),
        GUI:height(1)
    )
    row = row + 1
    -- Camera
    GUI.form_controls["Camera Label"] =
        forms.label(FORM, "Camera: ", GUI:col(0), GUI:row(row), GUI:width(left_form_width / 2), GUI:height(1))
    GUI.form_controls["Camera Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width / 2),
        GUI:row(row),
        GUI:width(left_form_width / 2),
        GUI:height(1)
    )

    row = row + 2
    -- Gold
    GUI.form_controls["Gold Label"] =
        forms.label(FORM, "Gold: ", GUI:col(0), GUI:row(row), GUI:width(left_form_width / 2), GUI:height(1))
    GUI.form_controls["Gold Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width / 2),
        GUI:row(row),
        GUI:width(left_form_width / 2),
        GUI:height(1)
    )

    local right_form_width = GUI.form_width - left_form_width
    local item_width = GUI:width(right_form_width) / 6 - GUI.form_padding

    GUI.form_controls["Arus Items Label"] =
        forms.label(FORM, "Arus Items", GUI:col(left_form_width), GUI:row(0), item_width, GUI:height(1))
    GUI.form_controls["Arus Items"] =
        forms.label(FORM, blank, GUI:col(left_form_width), GUI:row(1), item_width, GUI:height(8))
    GUI.form_controls["Arus EXP"] =
        forms.label(FORM, blank, GUI:col(left_form_width), GUI:row(9), item_width, GUI:height(1))
    
    GUI.form_controls["Kiefer Items Label"] =
        forms.label(
        FORM,
        "Kiefer Items",
        GUI:col(left_form_width) + item_width + GUI.form_padding,
        GUI:row(0),
        item_width,
        GUI:height(1)
    )
    GUI.form_controls["Kiefer Items"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width) + item_width + GUI.form_padding,
        GUI:row(1),
        item_width,
        GUI:height(8)
    )
    GUI.form_controls["Kiefer EXP"] =
        forms.label(
        FORM, 
        blank, 
        GUI:col(left_form_width) + item_width + GUI.form_padding, 
        GUI:row(9), 
        item_width, 
        GUI:height(1)
    )
    
    GUI.form_controls["Maribel Items Label"] =
        forms.label(
        FORM,
        "Maribel Items",
        GUI:col(left_form_width) + item_width * 2 + GUI.form_padding * 2,
        GUI:row(0),
        item_width,
        GUI:height(1)
    )
    GUI.form_controls["Maribel Items"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width) + item_width * 2 + GUI.form_padding * 2,
        GUI:row(1),
        item_width,
        GUI:height(8)
    )
    GUI.form_controls["Maribel EXP"] =
        forms.label(
        FORM, 
        blank, 
        GUI:col(left_form_width) + item_width * 2 + GUI.form_padding * 2, 
        GUI:row(9), 
        item_width, 
        GUI:height(1)
    )

    GUI.form_controls["Gabo Items Label"] =
        forms.label(
        FORM,
        "Gabo Items",
        GUI:col(left_form_width) + item_width * 3 + GUI.form_padding * 3,
        GUI:row(0),
        item_width,
        GUI:height(1)
    )
    GUI.form_controls["Gabo Items"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width) + item_width * 3 + GUI.form_padding * 3,
        GUI:row(1),
        item_width,
        GUI:height(8)
    )
    GUI.form_controls["Gabo EXP"] =
        forms.label(
        FORM, 
        blank, 
        GUI:col(left_form_width) + item_width * 3 + GUI.form_padding * 3,
        GUI:row(9), 
        item_width, 
        GUI:height(1)
    )

    GUI.form_controls["Melvin Items Label"] =
        forms.label(
        FORM,
        "Melvin Items",
        GUI:col(left_form_width) + item_width * 4 + GUI.form_padding * 4,
        GUI:row(0),
        item_width,
        GUI:height(1)
    )
    GUI.form_controls["Melvin Items"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width) + item_width * 4 + GUI.form_padding * 4,
        GUI:row(1),
        item_width,
        GUI:height(8)
    )
    GUI.form_controls["Melvin EXP"] =
        forms.label(
        FORM, 
        blank, 
        GUI:col(left_form_width) + item_width * 4 + GUI.form_padding * 4,
        GUI:row(9), 
        item_width, 
        GUI:height(1)
    )

    GUI.form_controls["Aira Items Label"] =
        forms.label(
        FORM,
        "Aira Items",
        GUI:col(left_form_width) + item_width * 5 + GUI.form_padding * 5,
        GUI:row(0),
        item_width,
        GUI:height(1)
    )
    GUI.form_controls["Aira Items"] =
        forms.label(
        FORM,
        blank,
        GUI:col(left_form_width) + item_width * 5 + GUI.form_padding * 5,
        GUI:row(1),
        item_width,
        GUI:height(8)
    )
    GUI.form_controls["Aira EXP"] =
        forms.label(
        FORM, 
        blank, 
        GUI:col(left_form_width) + item_width * 5 + GUI.form_padding * 5,
        GUI:row(9), 
        item_width, 
        GUI:height(1)
    )

    local enemy_width = GUI:width(right_form_width) / 4 - GUI.form_padding
    GUI.form_controls["Enemy Label"] =
        forms.label(FORM, "ENEMY:", GUI:col(left_form_width), GUI:row(10), enemy_width, GUI:height(1))
    GUI.form_controls["Enemy1 Name"] =
        forms.label(FORM, blank, GUI:col(left_form_width), GUI:row(11), enemy_width, GUI:height(1))
    GUI.form_controls["Enemy1 HP"] =
        forms.label(FORM, blank, GUI:col(left_form_width), GUI:row(12), enemy_width, GUI:height(1))

    GUI.form_controls["Enemy2 Name"] =
        forms.label(FORM, blank, GUI:col(left_form_width) + enemy_width, GUI:row(11), enemy_width, GUI:height(1))
    GUI.form_controls["Enemy2 HP"] =
        forms.label(FORM, blank, GUI:col(left_form_width) + enemy_width, GUI:row(12), enemy_width, GUI:height(1))

    GUI.form_controls["Enemy3 Name"] =
        forms.label(FORM, blank, GUI:col(left_form_width) + enemy_width * 2, GUI:row(11), enemy_width, GUI:height(1))
    GUI.form_controls["Enemy3 HP"] =
        forms.label(FORM, blank, GUI:col(left_form_width) + enemy_width * 2, GUI:row(12), enemy_width, GUI:height(1))

    GUI.form_controls["Enemy4 Name"] =
        forms.label(FORM, blank, GUI:col(left_form_width) + enemy_width * 3, GUI:row(11), enemy_width, GUI:height(1))
    GUI.form_controls["Enemy4 HP"] =
        forms.label(FORM, blank, GUI:col(left_form_width) + enemy_width * 3, GUI:row(12), enemy_width, GUI:height(1))
end

GUI.initGUI()

local function mainloop()
    forms.settext(GUI.form_controls["R Number Value"], getRNum())
    forms.settext(GUI.form_controls["Time Value"], getTime())
    forms.settext(GUI.form_controls["Frame Value"], emu.framecount())
    forms.settext(GUI.form_controls["X Value"], getPosX())
    forms.settext(GUI.form_controls["Z Value"], getPosZ())
    forms.settext(GUI.form_controls["Encount Value"], getEncountWalk())
    forms.settext(GUI.form_controls["Camera Value"], getCamera())
    forms.settext(GUI.form_controls["Gold Value"], get_gold() .. "G")

    forms.settext(GUI.form_controls["Arus Items"], table2str(get_items(ADDRESS.ARUS_ITEM_1)))
    forms.settext(GUI.form_controls["Kiefer Items"], table2str(get_items(ADDRESS.KIEFER_ITEM_1)))
    forms.settext(GUI.form_controls["Maribel Items"], table2str(get_items(ADDRESS.MARIBEL_ITEM_1)))
    forms.settext(GUI.form_controls["Gabo Items"], table2str(get_items(ADDRESS.GABO_ITEM_1)))
    forms.settext(GUI.form_controls["Melvin Items"], table2str(get_items(ADDRESS.MELVIN_ITEM_1)))
    forms.settext(GUI.form_controls["Aira Items"], table2str(get_items(ADDRESS.AIRA_ITEM_1)))
    
    forms.settext(GUI.form_controls["Arus EXP"], "exp." .. get_exp(ADDRESS.ARUS_EXP))
    forms.settext(GUI.form_controls["Kiefer EXP"], "exp." .. get_exp(ADDRESS.KIEFER_EXP))
    forms.settext(GUI.form_controls["Maribel EXP"], "exp." .. get_exp(ADDRESS.MARIBEL_EXP))
    forms.settext(GUI.form_controls["Gabo EXP"], "exp." .. get_exp(ADDRESS.GABO_EXP))
    forms.settext(GUI.form_controls["Melvin EXP"], "exp." .. get_exp(ADDRESS.MELVIN_EXP))
    forms.settext(GUI.form_controls["Aira EXP"], "exp." .. get_exp(ADDRESS.AIRA_EXP))

    forms.settext(GUI.form_controls["Enemy1 Name"], "1. " .. get_enemy_name(1))
    forms.settext(GUI.form_controls["Enemy1 HP"], "   HP: " .. get_enemy_HP(ADDRESS.ENEMY_1_HP))
    forms.settext(GUI.form_controls["Enemy2 Name"], "2. " .. get_enemy_name(2))
    forms.settext(GUI.form_controls["Enemy2 HP"], "   HP: " .. get_enemy_HP(ADDRESS.ENEMY_2_HP))
    forms.settext(GUI.form_controls["Enemy3 Name"], "3. " .. get_enemy_name(3))
    forms.settext(GUI.form_controls["Enemy3 HP"], "   HP: " .. get_enemy_HP(ADDRESS.ENEMY_3_HP))
    forms.settext(GUI.form_controls["Enemy4 Name"], "4. " .. get_enemy_name(4))
    forms.settext(GUI.form_controls["Enemy4 HP"], "   HP: " .. get_enemy_HP(ADDRESS.ENEMY_4_HP))
end

event.onframeend(mainloop)

while true do
    emu.frameadvance()
end
