return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false,
  ---@module 'avante'
  ---@type avante.Config
  opts = {
    provider = "copilot",
    providers = {
      gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta",
        model = "gemini-2.5-flash",
        timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 20480,
        },
      },
    },
    system_prompt = function()
      local hub = require("mcphub").get_hub_instance()
      return hub and hub:get_active_servers_prompt() or ""
    end,
    custom_tools = function()
      return {
        require("mcphub.extensions.avante").mcp_tool(),
      }
    end,
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- 以下依赖项是可选的，
    "echasnovski/mini.pick", -- 用于文件选择器提供者 mini.pick
    "nvim-telescope/telescope.nvim", -- 用于文件选择器提供者 telescope
    "hrsh7th/nvim-cmp", -- avante 命令和提及的自动完成
    "ibhagwan/fzf-lua", -- 用于文件选择器提供者 fzf
    "nvim-tree/nvim-web-devicons", -- 或 echasnovski/mini.icons
    {
      "zbirenbaum/copilot.lua", -- 用于 providers='copilot'
      event = "InsertEnter",
      config = function()
        require("copilot").setup({})
      end,
    },
    "ravitemer/mcphub.nvim", -- mcphub
    {
      -- 支持图像粘贴
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- 推荐设置
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- Windows 用户必需
          use_absolute_path = true,
        },
      },
    },
    {
      -- 如果您有 lazy=true，请确保正确设置
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
