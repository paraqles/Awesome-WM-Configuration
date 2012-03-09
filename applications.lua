--
--------------------------------------------------------------------------------
--         FILE:  applications.lua
--        USAGE:  NONE
--  DESCRIPTION:  Variabels that hold standard applications
--      OPTIONS:  ---
-- REQUIREMENTS:  ---
--         BUGS:  ---
--        NOTES:  ---
--       AUTHOR:  Dunkelzahn
--      COMPANY:  
--      VERSION:  1.0
--      CREATED:  01.03.2011 21:16:36 CET
--     REVISION:  ---
--------------------------------------------------------------------------------
--

-- This is used later as the default terminal and editor to run.
terminal = "gnome-terminal"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor

browser = "chromium-browser"
email = "icedove"
