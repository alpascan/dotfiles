local lazypath = vim.fn.stdpath("data") .. "/lazy-vscode/lazy.nvim"

vim.g.mapleader = " "
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
  lockfile = vim.fn.stdpath("config") .. "/lazy-vscode.lock",
  git = {
    clone_timeout = 600, -- 10 minutes
  }
}
require("lazy").setup({
  {
    "phaazon/hop.nvim",
    lazy = true,
    branch = "v2", -- optional but strongly recommended
    keys = {
      {
        "<leader>j",
        function()
          require("hop").hint_lines({ current_line_only = false })
        end,
        mode = { "n", "v" },
        desc = "hop jump",
      },
      {
        "<leader>k",
        function()
          require("hop").hint_lines({ current_line_only = false })
        end,
        mode = { "n", "v" },
        desc = "hop jump",
      },
    },
    opts = {},
    config = function(_, opts)
      require("hop").setup(opts)
    end,
  },
  {
    "ggandor/leap.nvim",
    dependencies = { "tpope/vim-repeat" },
    keys = {
      { "<leader>s", "<Plug>(leap-forward-to)", mode = { "n", "x", "o" }, desc = "leap jump forward" },
      { "<leader>S", "<Plug>(leap-backward-to)", mode = { "n", "x", "o" }, desc = "leap jump backward" },
      { "<leader>gs", "<Plug>(leap-from-window)", mode = { "n", "x", "o" }, desc = "leap jump window" },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    -- event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}, lazy_opts)


-- <leader> key

-- Open config with <leader>i
vim.cmd("nmap <leader>i :e ~/.config/nvim/vscode.lua<cr>")
  
-- Save file
vim.cmd("nmap <leader>s :w<cr>")

vim.opt.clipboard = "unnamedplus"

-- search ignoring case
vim.opt.ignorecase = true
vim.opt.smartcase = true

local keymap = vim.keymap

-- Redo with opposite of undo
keymap.set("n", "U", "<C-r>")

-- Move current line / block with <alt> j/k
-- keymap.set("n", "<A-k>", "<cmd>m .+1<cr>==")
-- keymap.set("n", "<A-j>", "<cmd>m .-2<cr>==")
-- keymap.set("i", "<A-u>", "<esc><cmd>m .+1<cr>==gi")
-- keymap.set("i", "<A-i>", "<esc><cmd>m .-2<cr>==gi")
-- keymap.set("v", "<A-u>", "<cmd>m '>+1<cr>gv=gv")
-- keymap.set("v", "<A-i>", "<cmd>m '<-2<cr>gv=gv")

-- Clear search highlighting
keymap.set("n", "<leader><space>", "<cmd>nohlsearch<cr>")

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})