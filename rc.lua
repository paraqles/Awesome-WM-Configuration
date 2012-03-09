-- Standard awesome library
require("awful")
require("awful.autofocus")
require("awful.rules")
-- Theme handling library
require("beautiful")
-- Notification library
require("naughty")
require("wicked")

HOME = os.getenv("HOME")
aw_config = HOME .. "/.config/awesome"
theme_dir = aw_config .. "/themes"

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init( theme_dir .. "/zenburn/theme.lua")


-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- User files
dofile(aw_config .. "/layouts.lua")
dofile(aw_config .. "/applications.lua")
dofile(aw_config .. "/menu.lua")
dofile(aw_config .. "/widget.lua")
dofile(aw_config .. "/key_binding.lua")
dofile(aw_config .. "/rules.lua")
