local status_ok, neorg = pcall(require, 'neorg')
if not status_ok then
  return
end

neorg.setup ({
  load = {
    ["core.defaults"] = {},
    ["core.journal"] = {
      config = {
        strategy = "flat",
      },
    },
    ["core.concealer"] = {
      config = {
        icon_preset = "diamond",
        icons = {
          todo = {
            cancelled = false,
            on_hold = false,
            pending = false,
          },
        },
      },
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "~/Documents/Notes",
        },
        default_workspace = "notes",
      },
    },
  },
})
