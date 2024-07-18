local dap = require('dap')
dap.configurations.java = {
    {
        type = 'java';
        request = 'attach';
        name = "Debug (Attach) - Remote";
        hostName = "127.0.0.1";
        port = 8787;
        projectName = "BigBirdStorageNode";
    },
}
return {
    "mfussenegger/nvim-dap",
    dependencies = {
        {
            "williamboman/mason.nvim",
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                vim.list_extend(opts.ensure_installed, { "java-test", "java-debug-adapter" })
            end,
        },
    },
}
