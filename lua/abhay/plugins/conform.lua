return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  opts = {
    formatters_by_ft = {
      java = {}, -- Disable formatting for Java by setting an empty table
      lua = { "stylua" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      -- json = { "prettierd" },
      -- jsonc = { "prettierd" },
      yaml = { "prettierd" },
      -- typescript = { "prettierd" },
      typescript = {},
      -- typescriptreact = { "prettierd" },
      typescriptreact = {},
      html = { "prettierd" },
      ejs = { "prettierd" },
      css = {},
      -- css = { "prettierd" },
      scss = { "prettierd" },
      graphql = { "prettierd" },
      markdown = { "prettierd" },
      python = { "isort", "black" },
      ruby = { "rubocop" },
      rust = { "rustfmt" },
      nix = { "nixpkgs_fmt" },
      ["_"] = { "trim_whitespace" },
    },
    format_on_save = function(bufnr)
      -- Disable autoformat on certain filetypes
      local ignore_filetypes = { "java", "typescript", "typescriptreact", "css", "json" }
      if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
        return
      end
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match("/node_modules/") then
        return
      end
      -- ...additional logic...
      return { lsp_format = "fallback" }
    end,
  },
}
