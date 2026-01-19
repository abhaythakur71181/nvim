return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local capabilities = cmp_nvim_lsp.default_capabilities()

    local java21 = "/opt/homebrew/Cellar/openjdk@21/21.0.9/libexec/openjdk.jdk/Contents/Home"

    -- Define diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, highlight = hl, numhl = "" })
    end

    -- Configure and enable LSP servers

    -- Pyright (Python)
    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })
    vim.lsp.enable("pyright")

    -- TypeScript / JavaScript
    vim.lsp.config("tsserver", {
      capabilities = capabilities,
    })
    vim.lsp.enable("tsserver")

    -- Rust
    vim.lsp.config("rust_analyzer", {
      capabilities = capabilities,
      filetypes = { "rust" },
      settings = {
        ["rust-analyzer"] = {},
      },
    })
    vim.lsp.enable("rust_analyzer")

    -- Java (jdtls)
    vim.lsp.config("jdtls", {
      cmd = {
        vim.fn.stdpath("data") .. "/mason/bin/jdtls",
        "--java-executable",
        java21 .. "/bin/java",
      },
      capabilities = capabilities,
      filetypes = { "java" },
      settings = {
        java = {
          configuration = {
            runtimes = {
              {
                name = "JavaSE-21",
                path = java21,
                default = true,
              },
            },
          },
        },
      },
    })
    vim.lsp.enable("jdtls")

    -- HTML
    vim.lsp.config("html", {
      capabilities = capabilities,
    })
    vim.lsp.enable("html")

    -- Emmet
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })
    vim.lsp.enable("emmet_ls")

    -- Nix
    vim.lsp.config("nil_ls", {
      capabilities = capabilities,
      filetypes = { "nix" },
    })
    vim.lsp.enable("nil_ls")

    -- Lua
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
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
      capabilities = capabilities,
    })
    vim.lsp.enable("tailwindcss")

    -- Bash
    vim.lsp.config("bashls", {
      capabilities = capabilities,
    })
    vim.lsp.enable("bashls")
  end,
}
