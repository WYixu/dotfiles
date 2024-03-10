local filesystem = require("gears.filesystem")
local home = os.getenv("HOME")
local config_dir = filesystem.get_configuration_dir()

local _M = {
  modkey = "Mod4", -- Win key

  terminal = "kitty",
  editor = os.getenv("EDITOR") or "nano",
  app_launcher = "rofi -no-lazy-grab -show drun -modi drun -theme " .. config_dir .. "deco/rofi.rasi",
}

return _M
