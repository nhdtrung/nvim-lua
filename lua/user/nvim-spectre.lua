local status_ok, spectre = pcall(require, "spectre")
if not status_ok then
  return
end

spectre.setup({
  find_engine = {
    -- rg is map with finder_cmd
    ['rg'] = {
      cmd = "rg",
      -- default args
      args = {
        '--color=never',
        '--no-ignore',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
      } ,
      options = {
        ['ignore-case'] = {
          value= "--ignore-case",
          icon="[I]",
          desc="ignore case"
        },
        ['hidden'] = {
          value="--hidden",
          desc="hidden file",
          icon="[H]"
        },
        -- you can put any rg search option you want here it can toggle with
        -- show_option function
      }
    },
    ['ag'] = {
      cmd = "ag",
      args = {
        '--vimgrep',
        '-s'
      } ,
      options = {
        ['ignore-case'] = {
          value= "-i",
          icon="[I]",
          desc="ignore case"
        },
        ['hidden'] = {
          value="--hidden",
          desc="hidden file",
          icon="[H]"
        },
      },
    },
  },
})
