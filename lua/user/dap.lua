
-- https://github.com/xdebug/vscode-php-debug/releases
-- Extract the vsix content
local dap = require'dap'
dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = {"/home/lenovo-legion-5/code/vscode-php-debug/out/phpDebug.js"},
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for xdebug',
        port = '9003',
        log = true,
        serverSourceRoot = '/var/www/src',
        localSourceRoot = '/home/lenovo-legion-5/code/denimio-m2-debug/src',
    },
}

require("nvim-dap-virtual-text").setup()
