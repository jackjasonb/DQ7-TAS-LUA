require "utils"

GUI = {
    form_controls = {},
    form_padding = 8,
    form_width = 17,
    form_height = 10,
    label_offset = 5,
    dropdown_offset = 1,
    long_label_width = 140,
    button_height = 23
}

local function round(num, idp)
    return tonumber(string.format("%." .. (idp or 0) .. "f", num))
end

function GUI:row(row_num)
    return round(self.form_padding + self.button_height * row_num, 0)
end

function GUI:col(col_num)
    return self:row(col_num)
end

function GUI:initGUI()
    local blank = "undifined"
    local row = 0

    FORM = forms.newform(GUI:col(GUI.form_width), GUI:row(GUI.form_height), "DQ7 Info")

    -- random number
    GUI.form_controls["R Number Label"] =
        forms.label(
        FORM,
        "R_NUM: ",
        GUI:col(0),
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )
    GUI.form_controls["R Number Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(GUI.form_width / 2) + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )

    row = row + 1
    -- time
    GUI.form_controls["Time Label"] =
        forms.label(
        FORM,
        "Time: ",
        GUI:col(0),
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )
    GUI.form_controls["Time Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(GUI.form_width / 2) + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )

    row = row + 1
    -- frame
    GUI.form_controls["Frame Label"] =
        forms.label(
        FORM,
        "Frame: ",
        GUI:col(0),
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )
    GUI.form_controls["Frame Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(GUI.form_width / 2) + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )

    row = row + 1
    -- Position
    GUI.form_controls["X Label"] =
        forms.label(FORM, "X:", GUI:col(0), GUI:row(row) + GUI.label_offset, 20, GUI.button_height)
    GUI.form_controls["X Value"] =
        forms.label(
        FORM,
        blank,
        20 + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 4) - GUI.label_offset,
        GUI.button_height
    )
    GUI.form_controls["Z Label"] =
        forms.label(
        FORM,
        "Z:",
        GUI:col(GUI.form_width / 2) + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        20,
        GUI.button_height
    )
    GUI.form_controls["Z Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(GUI.form_width / 2) + 20 + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 4) - GUI.label_offset,
        GUI.button_height
    )

    row = row + 1
    -- encount walk
    GUI.form_controls["Encount Label"] =
        forms.label(
        FORM,
        "Encount: ",
        GUI:col(0),
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )
    GUI.form_controls["Encount Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(GUI.form_width / 2) + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )

    row = row + 1
    -- Camera
    GUI.form_controls["Camera Label"] =
        forms.label(
        FORM,
        "Camera: ",
        GUI:col(0),
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )
    GUI.form_controls["Camera Value"] =
        forms.label(
        FORM,
        blank,
        GUI:col(GUI.form_width / 2) + GUI.label_offset,
        GUI:row(row) + GUI.label_offset,
        GUI:col(GUI.form_width / 2) - GUI.label_offset,
        GUI.button_height
    )
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
end

event.onframeend(mainloop, "test")
