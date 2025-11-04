return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "cpp", "python", "c", "javascript",
          "html", "vimdoc", "query", "markdown",
        },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
