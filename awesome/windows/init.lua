local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = require("beautiful.xresources").apply_dpi
local helpers = require("helpers")

local bling = require("bling")

client.connect_signal("manage", function(c) c.shape = helpers.rrect(0) end)

-- Custom Layouts -------------------------------------------------------------

local mstab = bling.layout.mstab
local centered = bling.layout.centered
local vertical = bling.layout.vertical
local horizontal = bling.layout.horizontal

-- Set the layouts

tag.connect_signal("request::default_layouts", function()
    awful.layout.append_default_layouts({
        awful.layout.suit.tile, awful.layout.suit.floating, centered, mstab,
        vertical, horizontal
    })
end)

-- Layout List Widget ---------------------------------------------------------


-- Popup
local layout_popup = awful.popup {
    widget = wibox.widget {
        ll,
        margins = dpi(24),
        widget = wibox.container.margin
    },
    border_color = beautiful.layoutlist_border_color,
    border_width = beautiful.layoutlist_border_width,
    placement = awful.placement.centered,
    ontop = true,
    visible = false,
    bg = beautiful.bg_normal
}

-- Key Bindings for Widget ----------------------------------------------------

-- Make sure you remove the default `Mod4+Space` and `Mod4+Shift+Space`
-- keybindings before adding this.
function gears.table.iterate_value(t, value, step_size, filter, start_at)
    local k = gears.table.hasitem(t, value, true, start_at)
    if not k then return end

    step_size = step_size or 1
    local new_key = gears.math.cycle(#t, k + step_size)

    if filter and not filter(t[new_key]) then
        for i = 1, #t do
            local k2 = gears.math.cycle(#t, new_key + i)
            if filter(t[k2]) then return t[k2], k2 end
        end
        return
    end

    return t[new_key], new_key
end


-- EOF ------------------------------------------------------------------------
