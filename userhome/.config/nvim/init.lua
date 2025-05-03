vim.cmd.set "mouse=a"
vim.cmd.set "nu"
vim.cmd.set "rnu"
vim.cmd.set "nobackup"
vim.cmd.set "autoindent"
vim.cmd.set "tabstop=4"
vim.cmd.set "shiftwidth=4"
vim.cmd.set "expandtab"
vim.cmd.set "smartindent"

vim.cmd.syntax "on"

-- Plugin manager setup
require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",  -- optional but recommended
    priority = 1000,      -- make sure it loads before other UI plugins
    config = function()
      -- Configure and set the colorscheme
      require("catppuccin").setup({
        flavour = "mocha",          -- Options: latte, frappe, macchiato, mocha
        transparent_background = true, -- Change to false if you want a solid background
      })

      -- Apply the colorscheme
      vim.cmd.colorscheme "catppuccin"
    end
  }
})

vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim."
})

