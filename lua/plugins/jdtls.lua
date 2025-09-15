return {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
        local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")

        local workspaces = {}
        if root_dir then
            local file = io.open(root_dir .. "/.bemol/ws_root_folders")
            if file then
                for line in file:lines() do
                    table.insert(workspaces, "file://" .. line)
                end
                file:close()
            end
        end

        for _, line in ipairs(workspaces) do
            vim.lsp.buf.add_workspace_folder(line)
        end

        local project_name = opts.project_name(root_dir)
        local cmd = vim.deepcopy(opts.cmd)
        if project_name then
            vim.list_extend(cmd, {
                "-configuration",
                opts.jdtls_config_dir(project_name),
                "-data",
                opts.jdtls_workspace_dir(project_name),
                -- Memory optimization
                "-Xms8g",
                "-Xmx32g",
                "-XX:+UseG1GC",
                "-XX:+UseStringDeduplication",
            })
        end

        opts.jdtls = {
            cmd = cmd,
            init_options = {
                workspaceFolders = workspaces,
                settings = {
                    java = {
                        -- Disable expensive features for large codebases
                        codeGeneration = {
                            hashCodeEquals = { useJava7Objects = true },
                            useBlocks = true,
                        },
                        completion = {
                            maxResults = 50,
                            enabled = true,
                        },
                        -- Reduce indexing overhead
                        maxConcurrentBuilds = 1,
                        -- Optimize imports and formatting
                        saveActions = {
                            organizeImports = false,
                        },
                        -- Reduce semantic highlighting load
                        semanticHighlighting = { enabled = false },
                        -- Limit references search
                        references = { includeDecompiledSources = false },
                        -- Disable expensive validations
                        validate = { enabled = false },
                    },
                },
            },
            root_dir = root_dir,
        }
    end,
}
