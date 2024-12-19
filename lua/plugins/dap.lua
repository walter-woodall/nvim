return {
    "mfussenegger/nvim-dap",
    opts = function ()
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
}
