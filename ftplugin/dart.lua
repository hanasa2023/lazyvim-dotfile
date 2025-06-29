local wk = require("which-key")

wk.add({
  -- flutter-tools
  { "<leader>F", group = "+Flutter" },
  { "<leader>Fr", "<cmd>FlutterRun<cr>", desc = "Run" },
  { "<leader>Fl", "<cmd>FlutterReload<cr>", desc = "Hot Reload" },
  { "<leader>FR", "<cmd>FlutterRestart<cr>", desc = "Hot Restart" },
  { "<leader>Fd", "<cmd>FlutterDevices<cr>", desc = "Devices" },
  { "<leader>Fe", "<cmd>FlutterEmulators<cr>", desc = "Emulators" },
  { "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", desc = "Toggle Outline" },
  { "<leader>Fq", "<cmd>FlutterQuit<cr>", desc = "Quit" },
}, { buffer = 0 })
