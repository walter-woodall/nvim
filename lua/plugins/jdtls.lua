return {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
        local cmd = { vim.fn.exepath("jdtls") }

        if LazyVim.has("mason.nvim") then
            local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
            table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
        end

        local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")

        if root_dir then
            local file = io.open(root_dir .. "/.bemol/ws_root_folders")
            if file then
                for line in file:lines() do
                    vim.lsp.buf.add_workspace_folder(line)
                end
                file:close()
            end
        end

        opts.jdtls = {
            cmd = cmd,
            root_dir = root_dir,
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
        }
    end,
}
