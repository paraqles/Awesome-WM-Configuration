--
--------------------------------------------------------------------------------
--         FILE:  widget.lua
--        USAGE:  NONE
--  DESCRIPTION:  widget definition for awesome
--      OPTIONS:  ---
-- REQUIREMENTS:  ---
--         BUGS:  ---
--        NOTES:  ---
--       AUTHOR:  Dunkelzahn
--      COMPANY:  
--      VERSION:  1.0
--      CREATED:  01.03.2011 20:38:39 CET
--     REVISION:  ---
--------------------------------------------------------------------------------
--
require("awesome")
require("awful")
require("vicious")

launcher = awful.widget.launcher({
  image = image(beautiful.awesome_icon),
  menu = mainmenu
  }
)
-- Create a textclock widget
clock = awful.widget.textclock({
  align = "right"
  },
  "%Y/%m/%d %H:%M:%S"
)
-- Create widget boxes for some information
-- systray box is no array due to count restrictions (only one systray)
systray = widget({ type = "systray" })
-- The top bar
topwibox = {}
-- The bottom bar
bottombox = {}

-- Run/Lua promptbox
promptbox = {}
-- Layout icon box
layoutbox = {}

-- Taglist box (the different desktops)
taglist = {}
-- Buttonactions on the taglistbox
taglist.buttons = awful.util.table.join(
  -- jump to desktop under cursor
  awful.button({ }, 1, awful.tag.viewonly),
  -- move current selected window to desktop under cursor
  awful.button({ modkey }, 1, awful.client.movetotag),

  awful.button({ }, 3, awful.tag.viewtoggle),
  awful.button({ modkey }, 3, awful.client.toggletag),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
)
tasklist = {}
tasklist.buttons = awful.util.table.join(
  awful.button({ }, 1,
    function (c)
      if not c:isvisible() then
        awful.tag.viewonly(c:tags()[1])
      end
      client.focus = c
      c:raise()
    end
  ),
  awful.button({ }, 3,
    function ()
      if instance then
        instance:hide()
        instance = nil
      else
        instance = awful.menu.clients({ width=250 })
      end
    end
  ),
  awful.button({ }, 4,
    function ()
      awful.client.focus.byidx(1)
      if client.focus then
        client.focus:raise()
      end
    end
  ),
  awful.button({ }, 5,
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then
        client.focus:raise()
      end
    end
  )
)

for s = 1, screen.count() do
  -- Create a promptbox for each screen
  promptbox[s] = awful.widget.prompt({ layout = awful.widget.layout.horizontal.leftright })
  -- Create an imagebox widget which will contains an icon indicating which layout we're using.
  -- We need one layoutbox per screen.
  layoutbox[s] = awful.widget.layoutbox(s)
  layoutbox[s]:buttons(
    awful.util.table.join(
      awful.button({ }, 1,
        function ()
          awful.layout.inc(layouts, 1)
        end
      ),
      awful.button({ }, 3,
        function ()
          awful.layout.inc(layouts, -1)
        end
      ),
      awful.button({ }, 4,
        function ()
          awful.layout.inc(layouts, 1)
        end
      ),
      awful.button({ }, 5,
        function ()
          awful.layout.inc(layouts, -1)
        end
      )
    )
  )
  -- Create a taglist widget
  taglist[s] = awful.widget.taglist(s, awful.widget.taglist.label.all, taglist.buttons)

  -- Create a tasklist widget
  tasklist[s] = awful.widget.tasklist(
    function(c)
      return awful.widget.tasklist.label.currenttags(c, s)
    end,
    tasklist.buttons
  )
  -- Create the wibox
  topwibox[s] = awful.wibox({ position = "top", screen = s })
  -- Add widgets to the wibox - order matters
  topwibox[s].widgets = {
    {
      launcher,
      taglist[s],
      layout = awful.widget.layout.horizontal.leftright
    },
    layoutbox[s],
    clock,
    s == 1 and systray or nil,
    layout = awful.widget.layout.horizontal.rightleft
  }
  bottombox[s] = awful.wibox({ position = "bottom", screen = s })
  bottombox[s].widgets = {
    {
      promptbox[s],
      layout = awful.widget.layout.horizontal.leftright
    },
    tasklist[s],
    layout = awful.widget.layout.horizontal.rightleft
  }
end
-- }}}
