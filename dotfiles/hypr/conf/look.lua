local t = require("conf.theme")

hl.config({
    general = {
        gaps_in  = t.gaps / 2,
        gaps_out = t.gaps,

        border_size = t.border,

        col = {
            active_border   = t.rgba(t.accent, 0.8),
            inactive_border = t.rgba(t.surface),
        },

        resize_on_border = true,
        layout           = "dwindle",
    },

    decoration = {
        rounding       = t.radius,
        rounding_power = 2,

        shadow = {
            enabled      = true,
            range        = 12,
            render_power = 3,
            color        = 0x55000000,
        },

        blur = {
            enabled = true,
            size    = 6,
            passes  = 2,
        },
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        background_color         = tonumber("0xff" .. t.bg),
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        force_default_wallpaper  = 0,
    },

    -- cursor = { no_hardware_cursors = true }, -- if the cursor flickers on NVIDIA
})
