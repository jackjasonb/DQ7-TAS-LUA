-- rootからの相対パス
require "./src/utils"

GUI = {
    form_controls = {},
    form_width = 32,
    form_height = 18,
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

    
    -- Player Status
    local right_form_width = GUI.form_width - left_form_width
    local item_width = GUI:width(right_form_width) / 6 - GUI.form_padding
    for i = 1, 6 do
        local column = GUI:col(left_form_width) + (item_width + GUI.form_padding) * (i - 1)
        GUI.form_controls[PLAYER[i] .. " Items Label"] = forms.label(FORM, 
                                                                     PLAYER[i] .. " Items", 
                                                                     column, 
                                                                     GUI:row(0), 
                                                                     item_width, 
                                                                     GUI:height(1))
        GUI.form_controls[PLAYER[i] .. " Items"] =
            forms.label(FORM, blank, column, GUI:row(1), item_width, GUI:height(8))
        GUI.form_controls[PLAYER[i] .. " Name"] =
            forms.label(FORM, PLAYER[i], column, GUI:row(9), item_width, GUI:height(1))
        GUI.form_controls[PLAYER[i] .. " HP"] =
            forms.label(FORM, blank, column, GUI:row(10), item_width, GUI:height(1))
        GUI.form_controls[PLAYER[i] .. " EXP"] =
            forms.label(FORM, blank, column, GUI:row(11), item_width, GUI:height(1))
    end

    -- Enemy Status
    local enemy_row = 12 -- プレイヤーステータスを増やしたらここの値も変える
    local enemy_width = GUI:width(right_form_width) / 4 - GUI.form_padding

    GUI.form_controls["Enemy Label"] =
        forms.label(FORM, 
                    "ENEMY:", 
                    GUI:col(left_form_width), 
                    GUI:row(enemy_row), 
                    enemy_width, 
                    GUI:height(1))    
    for i = 1, 4 do
        local column = GUI:col(left_form_width) + enemy_width * (i - 1)
        GUI.form_controls["Enemy" .. i .. " Name"] =
            forms.label(FORM, 
                        blank, 
                        column, 
                        GUI:row(enemy_row + 1), 
                        enemy_width, 
                        GUI:height(1))
        GUI.form_controls["Enemy" .. i .. " HP"] =
            forms.label(FORM, 
                        blank, 
                        column, 
                        GUI:row(enemy_row + 2), 
                        enemy_width, 
                        GUI:height(1))
    end

end


function mainloop()
    forms.settext(GUI.form_controls["R Number Value"], getRNum())
    forms.settext(GUI.form_controls["Time Value"], getTime())
    forms.settext(GUI.form_controls["Frame Value"], emu.framecount())
    forms.settext(GUI.form_controls["X Value"], getPosX())
    forms.settext(GUI.form_controls["Z Value"], getPosZ())
    forms.settext(GUI.form_controls["Encount Value"], getEncountWalk())
    forms.settext(GUI.form_controls["Camera Value"], getCamera())
    forms.settext(GUI.form_controls["Gold Value"], get_gold() .. "G")

    -- Player Info
    for i = 1, 6 do
        forms.settext(GUI.form_controls[PLAYER[i] .. " Items"], 
                      table2str(get_items(ADDRESS[PLAYER[i]:upper() .. "_ITEM_1"])))
        forms.settext(GUI.form_controls[PLAYER[i] .. " EXP"],
                      "exp." .. get_exp(ADDRESS[PLAYER[i]:upper() .. "_EXP"]))
        forms.settext(GUI.form_controls[PLAYER[i] .. " HP"],
                      "HP: " .. get_player_hp(ADDRESS[PLAYER[i]:upper() .. "_HP"]))
    end
    
    -- Enemy Info
    forms.settext(GUI.form_controls["Enemy Label"], "ENEMY:  TURN: " .. get_turn_now())
    for i = 1, 4 do
        forms.settext(GUI.form_controls["Enemy" .. i .. " Name"], "1. " .. get_enemy_name(i))
        forms.settext(GUI.form_controls["Enemy" .. i .. " HP"], "   HP: " .. get_enemy_HP(i))
    end

end
