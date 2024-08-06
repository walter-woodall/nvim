function bemol()
    local bemol_dir = vim.fs.find({ '.bemol' }, { upward = true, type = 'directory'})[1]
    local ws_folders_lsp = {}
    if bemol_dir then
        local file = io.open(bemol_dir .. '/ws_root_folders', 'r')
        if file then
            vim.notify("Loading LSP files from Bemol!!")
            for line in file:lines() do
                table.insert(ws_folders_lsp, line)
            end
            file:close()
        end
    end

    for _, line in ipairs(ws_folders_lsp) do
        vim.notify(string.format("Adding workspace folder to LSP: %s", line))
        vim.lsp.buf.add_workspace_folder(line)
    end

end


return {
    "mfussenegger/nvim-jdtls",
    opts = function()
        local mason_registry = require("mason-registry")
        local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
        return {
            -- How to find the root dir for a given filename. The default comes from
            -- lspconfig which provides a function specifically for java projects.
            root_dir = require("lspconfig.server_configurations.jdtls").default_config.root_dir,

            -- How to find the project name for a given root dir.
            project_name = function(root_dir)
                return root_dir and vim.fs.basename(root_dir)
            end,

            -- Where are the config and workspace dirs for a project?
            jdtls_config_dir = function(project_name)
                return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
            end,
            jdtls_workspace_dir = function(project_name)
                return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
            end,

            -- How to run jdtls. This can be overridden to a full java command-line
            -- if the Python wrapper script doesn't suffice.
            cmd = {
                vim.fn.exepath("jdtls"),
                "--jvm-arg=-Xms2G",
                "--jvm-arg=-Xmx8G",
                "--jvm-arg=-XX:+UseG1GC",
                string.format("--jvm-arg=-javaagent:%s", lombok_jar),
            },
            full_cmd = function(opts)
                local fname = vim.api.nvim_buf_get_name(0)
                local root_dir = opts.root_dir(fname)
                local project_name = opts.project_name(root_dir)
                local cmd = vim.deepcopy(opts.cmd)
                if project_name then
                    vim.list_extend(cmd, {
                        "-configuration",
                        opts.jdtls_config_dir(project_name),
                        "-data",
                        opts.jdtls_workspace_dir(project_name),
                    })
                end
                return cmd
            end,

            -- These depend on nvim-dap, but can additionally be disabled by setting false here.
            dap = { hotcodereplace = "auto", config_overrides = {} },
            dap_main = {},
            test = true,
            settings = {
                java = {
                    edit = {
                        validateAllOpenBuffersOnChanges = false,
                    },
                    inlayHints = {
                        parameterNames = {
                            enabled = "all",
                        },
                    },
                },
            },
        }
    end
}
