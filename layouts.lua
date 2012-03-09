--
--------------------------------------------------------------------------------
--         FILE:  layouts.lua
--        USAGE:  NONE
--  DESCRIPTION:  Layouts for awesome configuration.
--      OPTIONS:  ---
-- REQUIREMENTS:  ---
--         BUGS:  ---
--        NOTES:  ---
--       AUTHOR:  Dunkelzahn
--      COMPANY:  
--      VERSION:  1.0
--      CREATED:  27.02.2011 13:43:49 CET
--     REVISION:  ---
--------------------------------------------------------------------------------
--
require("awful.layout.suit")

-- Table of layouts to cover with awful.layout.inc, order matters.
layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}
-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
for s = 1, screen.count() do
  -- Each screen has its own tag table.
  tags[s] = awful.tag({ "main", 2, 3, 4, "mail", "dev", "dev0", 8, 9 }, s, layouts[6])
end
-- }}}
