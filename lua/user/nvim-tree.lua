local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  disable_netrw = true,
  hijack_netrw = true,
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = true,
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = true,
    custom = {},
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  view = {
    width = 45,
    hide_root_folder = false,
    side = "left",
    number = false,
    relativenumber = false,
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
}
