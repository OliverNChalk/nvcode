-- Example configuations here: https://github.com/mattn/efm-langserver
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
local M = {}

M.setup = function()
    local tsserver_args = {}

    local prettier = {
        formatCommand = "prettier --stdin-filepath ${INPUT}",
        formatStdin = true
    }

    local eslint_d = {
        lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
        lintStdin = true,
        lintIgnoreExitCode = true,
        formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
        formatStdin = true
    }

    if vim.fn.glob("node_modules/.bin/prettier") ~= "" then
        prettier = {
            formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
            formatStdin = true
        }
    end

    require"lspconfig".efm.setup {
        -- init_options = {initializationOptions},
        cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
        init_options = {documentFormatting = true, codeAction = false},
        filetypes = {"html", "css", "yaml", "vue", "javascript", "javascriptreact", "typescript", "typescriptreact"},
        settings = {
            rootMarkers = {".git/", "package.json"},
            languages = {
                html = {prettier},
                css = {prettier},
                json = {eslint_d},
                yaml = {prettier},
                javascript = {eslint_d},
                javascriptreact = {eslint_d},
                typescript = {eslint_d},
                typescriptreact = {eslint_d},
            }
        }
    }
end

return M
