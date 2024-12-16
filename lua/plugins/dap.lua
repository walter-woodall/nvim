return {
    "mfussenegger/nvim-dap",
    ops = function ()
        local dap = require('dap')
        dap.configurations.java = {
            {
                type = 'java';
                request = 'attach';
                name = "Debug (Attach) - Remote";
                hostName = "127.0.0.1";
                port = 8787;
            },
            {
                type = 'java';
                request = 'attach';
                name = "Debug (Attach) - BigBirdStorageNode";
                hostName = "127.0.0.1";
                projectName = "BigBirdStorageNode";
                port = 8787;
            },
            {
                type = 'java';
                request = 'attach';
                name = "Debug (Attach) - SaddleJavaClient";
                hostName = "127.0.0.1";
                projectName = "SaddleJavaClient";
                port = 8787;
            },
        }
    end,
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                vim.list_extend(opts.ensure_installed, { "codelldb", "java-test", "java-debug-adapter" })
            end,
        },
    },
}
