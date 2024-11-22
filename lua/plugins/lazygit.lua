return
{
  "kdheepak/lazygit.nvim",
  lazy = false,
  dependencies = { "akinsho/toggleterm.nvim" },
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_winblend = 0
    vim.g.lazygit_use_neovim_remote = true
  end,
}
