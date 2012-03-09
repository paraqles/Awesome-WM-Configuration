--
--------------------------------------------------------------------------------
--         FILE:  menu.lua
--        USAGE:  NONE
--  DESCRIPTION:  Menu definition for awesome
--      OPTIONS:  ---
-- REQUIREMENTS:  ---
--         BUGS:  ---
--        NOTES:  ---
--       AUTHOR:  Dunkelzahn
--      COMPANY:  
--      VERSION:  1.0
--      CREATED:  01.03.2011 20:31:07 CET
--     REVISION:  ---
--------------------------------------------------------------------------------
--
require("awesome")
require("awful")
require("debian.menu")
require("applications")

-- {{{ Menu
-- Create a laucher widget and a main menu
awesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awful.util.getdir("config") .. "/rc.lua" },
  { "restart", awesome.restart },
  { "quit", awesome.quit }
}

mainmenu = awful.menu( {
  items = {
    { "Logout", awesome.quit },
    { "Lock", "xscreensaver-command -lock" },
    { "Suspend", "gksu pm-suspend" },
    { "Shutdown", "gksu halt" },
    { "Reboot", "gksu reboot" },
    { "Restart Awesome", awesome.restart },
    { "---------------" },
    { "Debian", debian.menu.Debian_menu.Debian },
    { "open terminal", terminal }
  }
})
