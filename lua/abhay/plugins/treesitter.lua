return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,       -- disable lazy-loading
  build = false,      -- avoid automatic build
  priority = 1000,    -- load first

  config = function()
    local ok, ts = pcall(require, "nvim-treesitter.configs")
    if not ok then
      -- only notify if really missing
      vim.notify("nvim-treesitter not available; skipping setup", vim.log.levels.WARN)
      return
    end

    ts.setup {
      ensure_installed = {
        "c","lua","vim","vimdoc","html","css","java",
        "javascript","typescript","python","markdown","markdown_inline",
      },
      sync_install = false,
      auto_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting = false },
      rainbow = { enable = true },
    }

    pcall(function()
      require("nvim-ts-autotag").setup {
        opts = { enable_close = true, enable_rename = true, enable_close_on_slash = false },
        per_filetype = { html = { enable_close = false } },
      }
    end)
  end,
}

