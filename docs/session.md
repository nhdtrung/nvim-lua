# 💾 Persistence

**Persistence** is a simple lua plugin for automated session management.

## ✨ Features

- automatically saves the active session under `.config/nvim/sessions` on exit
- simple API to restore the current or last session

## 🚀 Usage

**Persistence** works well with plugins like `startify` or `dashboard`. It will never restore a session automatically,
but you can of course write an autocmd that does exactly that if you want.


```lua
-- restore the session for the current directory
vim.api.nvim_set_keymap("n", "<leader>sr", [[<cmd>lua require("persistence").load()<cr>]], {})
```

