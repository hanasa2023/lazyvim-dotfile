return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>",           desc = "Delete Buffers to the Right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>",            desc = "Delete Buffers to the Left" },
    { "<leader>1",  "<Cmd>BufferLineGoToBuffer 1<CR>",         desc = "Go to first buffer" },
    { "<leader>2",  "<Cmd>BufferLineGoToBuffer 2<CR>",         desc = "Go to second buffer" },
    { "<leader>3",  "<Cmd>BufferLineGoToBuffer 3<CR>",         desc = "Go to third buffer" },
    { "<leader>4",  "<Cmd>BufferLineGoToBuffer 4<CR>",         desc = "Go to fouth buffer" },
    { "<leader>5",  "<Cmd>BufferLineGoToBuffer 5<CR>",         desc = "Go to fifith buffer" },
    { "<leader>6",  "<Cmd>BufferLineGoToBuffer 6<CR>",         desc = "Go to sixth buffer" },
    { "<leader>7",  "<Cmd>BufferLineGoToBuffer 7<CR>",         desc = "Go to seventh buffer" },
    { "<leader>8",  "<Cmd>BufferLineGoToBuffer 8<CR>",         desc = "Go to eighth buffer" },
    { "<leader>9",  "<Cmd>BufferLineGoToBuffer 9<CR>",         desc = "Go to ninth buffer" },
    { "<S-h>",      "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
    { "<S-l>",      "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
    { "[b",         "<cmd>BufferLineCyclePrev<cr>",            desc = "Prev Buffer" },
    { "]b",         "<cmd>BufferLineCycleNext<cr>",            desc = "Next Buffer" },
    { "[B",         "<cmd>BufferLineMovePrev<cr>",             desc = "Move buffer prev" },
    { "]B",         "<cmd>BufferLineMoveNext<cr>",             desc = "Move buffer next" },
  },
  opts = {
    options = {
      -- stylua: ignore
      close_command = function(n) Snacks.bufdelete(n) end,
      -- stylua: ignore
      right_mouse_command = function(n) Snacks.bufdelete(n) end,
      diagnostics = "nvim_lsp",
      always_show_bufferline = true,
      diagnostics_indicator = function(_, _, diag)
        local icons = LazyVim.config.icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      numbers = "ordinal",
      buffer_close_icon = "",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 20,
      offsets = {
        {
          filetype = "neo-tree",
          text = "󰴈 Hanasaki",
          highlight = "Directory",
          text_align = "center",
          spearator = false
        },
      },
      ---@param opts bufferline.IconFetcherOpts
      get_element_icon = function(opts)
        return LazyVim.config.icons.ft[opts.filetype]
      end,
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- Fix bufferline when restoring a session
    vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
      callback = function()
        vim.schedule(function()
          pcall(nvim_bufferline)
        end)
      end,
    })
  end,
}
