local filesystem = require("gears.filesystem")
local config_dir = filesystem.get_configuration_dir()
local utils_dir = config_dir .. "app/"

local _M = {
  full_screenshot = utils_dir .. "screensht full",
  area_screenshot = utils_dir .. "screensht area",
}

return _M
