-- Single source of truth for the look. Waybar, mako, fuzzel and hyprlock use the same palette.
local theme = {
    font = "Adwaita Sans",
    mono = "JetBrainsMono Nerd Font",

    bg      = "111318",
    surface = "1c1f26",
    muted   = "5c6370",
    fg      = "c8ccd4",
    accent  = "8aa4c8",
    urgent  = "d08770",

    gaps    = 6,
    border  = 1,
    radius  = 6,
}

function theme.rgba(hex, alpha)
    return string.format("rgba(%s%02x)", hex, math.floor((alpha or 1) * 255))
end

return theme
