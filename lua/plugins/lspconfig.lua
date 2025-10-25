require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", -- Lua
		"ts_ls", -- Typescript
		"cssls", -- CSS
		"tailwindcss", -- Tailwind
		"html", -- HTML
		"omnisharp", -- C#
		"rust_analyzer", -- Rust
		"pyright", -- Python
		"clangd", -- C/C++
		"jdtls", -- Java
		"yamlls", -- YAML
		"jsonls", -- JSON
		"dockerls", -- Docker
		"sqlls", -- SQL
		"graphql", -- GraphQL
		"marksman", -- Markdown
		"eslint", -- ESLint
		"bashls", -- Bash
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"stylua", -- Lua formatter
		"eslint_d", -- JS/TS linter
		"prettierd", -- JS/TS formatter
		"black", -- Python formatter
		"isort", -- Python import sorter
		"clang_format", -- C/C++ formatter
		"markdownlint", -- Markdown linter
		"sql_formatter", -- SQL formatter
		"yamlfmt", -- YAML formatter
		"csharpier", -- C# formatter
	},
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSP settings for various languages
-- Lua
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.enable("lua_ls")

-- CSS
vim.lsp.config("cssls", {
    capabilities = capabilities,
})
vim.lsp.enable("cssls")

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
  settings = {
    tailwindCSS = {
      includeLanguages = {
        typescript = "javascript",
        typescriptreact = "javascript",
        html = "html",
        css = "css",
        -- Add other file types as needed, e.g., "vue", "svelte"
      },
    },
  },
capabilities = capabilities,
})

vim.lsp.enable("tailwindcss", {})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})
vim.lsp.enable("ts_ls", {})

-- Rust
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
})
vim.lsp.enable("rust_analyzer")

-- C#
vim.lsp.config("omnisharp", {
    capabilities = capabilities,
})
vim.lsp.enable("omnisharp")

-- HTML
vim.lsp.config("html", {
    capabilities = capabilities,
})
vim.lsp.enable("html")

-- Python
vim.lsp.config("pyright", {
    capabilities = capabilities,
})
vim.lsp.enable("pyright")

-- C/C++
vim.lsp.config("clangd", {
    capabilities = capabilities,
})
vim.lsp.enable("clangd")

-- Java
vim.lsp.config("jdtls", {
    capabilities = capabilities,
})
vim.lsp.enable("jdtls")

-- YAML
vim.lsp.config("yamlls", {
    capabilities = capabilities,
})
vim.lsp.enable("yamlls")

-- JSON
vim.lsp.config("jsonls", {
    capabilities = capabilities,
})
vim.lsp.enable("jsonls")

-- Docker
vim.lsp.config("dockerls", {
    capabilities = capabilities,
})
vim.lsp.enable("dockerls")

-- SQL
vim.lsp.config("sqlls", {
    capabilities = capabilities,
})
vim.lsp.enable("sqlls")

-- GraphQL
vim.lsp.config("graphql", {
    capabilities = capabilities,
})
vim.lsp.enable("graphql")

-- Markdown
vim.lsp.config("marksman", {
    capabilities = capabilities,
})
vim.lsp.enable("marksman")

-- ESLint
vim.lsp.config("eslint", {
    capabilities = capabilities,
})
vim.lsp.enable("eslint")

-- Bash
vim.lsp.config("bashls", {
    capabilities = capabilities,
})
vim.lsp.enable("bashls")

-- vim.lsp.config("tailwind-tools", {
--     capabilities = capabilities,
-- })
-- vim.lsp.enable("tailwind-tools")
--
-- Linter and Formatter settings
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua, -- Lua formatter
		null_ls.builtins.completion.spell, -- spell checking
		require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
	},
})

