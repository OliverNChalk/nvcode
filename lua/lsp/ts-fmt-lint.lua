-- Example configuations here: https://github.com/mattn/efm-langserver
-- You can look for project scope Prettier and Eslint with e.g. vim.fn.glob("node_modules/.bin/prettier") etc. If it is not found revert to global Prettier where needed.
local M = {}

M.setup = function()
    local tsserver_args = {}

    local prettier = {
        formatCommand = "prettier --stdin-filepath ${INPUT}",
        formatStdin = true
    }

    if vim.fn.glob("node_modules/.bin/prettier") ~= "" then
        prettier = {
            formatCommand = "./node_modules/.bin/prettier --stdin-filepath ${INPUT}",
            formatStdin = true
        }
    end

    local eslint_d = {
        lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
        lintStdin = true,
        lintFormats = {"%f:%l:%c: %m"},
        lintIgnoreExitCode = true,
        formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
        formatStdin = true
    }

    require"lspconfig".efm.setup {
        -- init_options = {initializationOptions},
        cmd = {DATA_PATH .. "/lspinstall/efm/efm-langserver"},
        init_options = {documentFormatting = true, codeAction = false},
        filetypes = {"html", "css", "yaml", "vue", "javascript", "javascriptreact", "typescript", "typescriptreact"},
        settings = {
            rootMarkers = {".git/", "package.json"},
            languages = {
                html = {eslint_d},
                css = {eslint_d},
                json = {eslint_d},
                yaml = {eslint_d},
            }
        }
    }
end

return M
