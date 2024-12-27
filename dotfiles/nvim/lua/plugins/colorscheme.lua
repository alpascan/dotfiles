return {
  {
    "loctvl842/monokai-pro.nvim",
    opts = {
      filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
      plugins = {
        bufferline = {
          underline_selected = false,
          underline_visible = false,
        },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "monokai-pro",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      theme = "monokai-pro",
    },
  },
}
