hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("smooth", { type = "bezier", points = { {0.25, 1}, {0.5, 1} } })

hl.animation({ leaf = "global",     enabled = true, speed = 4,   bezier = "smooth" })
hl.animation({ leaf = "windows",    enabled = true, speed = 3,   bezier = "smooth", style = "popin 95%" })
hl.animation({ leaf = "border",     enabled = true, speed = 4,   bezier = "smooth" })
hl.animation({ leaf = "fade",       enabled = true, speed = 3,   bezier = "smooth" })
hl.animation({ leaf = "layers",     enabled = true, speed = 3,   bezier = "smooth", style = "fade" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3,   bezier = "smooth", style = "slidefade 15%" })
