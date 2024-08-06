local dap = require('dap')
dap.configurations.java = {
    {
        type = 'java';
        request = 'attach';
        name = "Remote Debug (Attach)";
        hostName = "127.0.0.1";
        port = 8787;
    },
    {
        type = 'java';
        request = 'attach';
        name = "Remote Debug (Attach) - BigBirdStorageNode";
        hostName = "127.0.0.1";
        projectName = "BigBirdStorageNode";
        port = 8787;
    },
}
return {
    "mfussenegger/nvim-dap",
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
