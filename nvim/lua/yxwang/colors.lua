local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

color_scheme.setup {
  style = 'warmer',
}
color_scheme.load()

