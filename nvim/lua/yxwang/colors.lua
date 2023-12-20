local status_ok, color_scheme = pcall(require, 'onedark')
if not status_ok then
  return
end

color_scheme.setup {
  style = 'deep',
}
color_scheme.load()

