local cmp_status_ok, auto_session = pcall(require, "auto-session")
if not cmp_status_ok then
  return
end

auto_session.setup {
    auto_save_enabled = true,
    auto_restore_enabled = true,
    auto_session_enabled = true,
    auto_session_create_enabled = true,
    -- auto_session_enable_last_session = true,
    bypass_session_save_file_types = nil, -- boolean: Bypass auto save when only buffer open is one of these file types
    cwd_change_handling = { -- table: Config for handling the DirChangePre and DirChanged autocmds, can be set to nil to disable altogether
        restore_upcoming_session = true, -- boolean: restore session for upcoming cwd on cwd change
        pre_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChangedPre` autocmd
        post_cwd_changed_hook = nil, -- function: This is called after auto_session code runs for the `DirChanged` autocmd
    },
}
