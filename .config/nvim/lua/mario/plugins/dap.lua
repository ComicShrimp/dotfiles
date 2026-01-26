return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require("dap")
      local ui = require("dapui")

      require("dapui").setup()
      require("dap-go").setup()

      require("nvim-dap-virtual-text").setup({})

      -- DAP Adapters
      local adapters = {
        ["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        },
        ["node"] = function(cb, config)
          if config.type == "node" then
            config.type = "pwa-node"
          end
          local a = dap.adapters["pwa-node"]
          if type(a) == "function" then
            a(cb, config)
          else
            cb(a)
          end
        end,
      }

      -- DAP Configurations
      local configurations = {
        typescript = {
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Node.js",
            port = 9229,
            address = "localhost",
            localRoot = vim.fn.getcwd(),
            remoteRoot = "/usr/src/app",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to a process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        },
      }

      -- Share TypeScript config with JavaScript
      dap.configurations.javascript = dap.configurations.typescript

      -- Setup adapters
      for name, config in pairs(adapters) do
        dap.adapters[name] = config
      end

      -- Setup configurations
      for lang, config in pairs(configurations) do
        dap.configurations[lang] = config
      end

      -- Eval var under cursor
      vim.keymap.set("n", "<space>?", function()
        require("dapui").eval(nil, { enter = true })
      end)

      vim.keymap.set("n", "<leader>db", function()
        require("dap").toggle_breakpoint()
      end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>dB", function()
        require("dap").list_breakpoints()
        vim.cmd("copen")
      end, { desc = "List Breakpoints" })
      vim.keymap.set("n", "<leader>dc", function()
        require("dap").continue()
      end, { desc = "Run/Continue" })
      vim.keymap.set("n", "<leader>dC", function()
        require("dap").run_to_cursor()
      end, { desc = "Run to Cursor" })
      vim.keymap.set("n", "<leader>dg", function()
        require("dap").goto_()
      end, { desc = "Go to Line (No Execute)" })
      vim.keymap.set("n", "<leader>di", function()
        require("dap").step_into()
      end, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>dj", function()
        require("dap").down()
      end, { desc = "Down" })
      vim.keymap.set("n", "<leader>dk", function()
        require("dap").up()
      end, { desc = "Up" })
      vim.keymap.set("n", "<leader>dl", function()
        require("dap").run_last()
      end, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>do", function()
        require("dap").step_out()
      end, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>dO", function()
        require("dap").step_over()
      end, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>dP", function()
        require("dap").pause()
      end, { desc = "Pause" })
      vim.keymap.set("n", "<leader>dr", function()
        require("dap").repl.toggle()
      end, { desc = "Toggle REPL" })
      vim.keymap.set("n", "<leader>ds", function()
        require("dap").session()
      end, { desc = "Session" })
      vim.keymap.set("n", "<leader>dt", function()
        require("dap").terminate()
        vim.defer_fn(function()
          require("dapui").close({})
        end, 100)
      end, { desc = "Terminate" })
      vim.keymap.set("n", "<leader>dw", function()
        require("dap.ui.widgets").hover()
      end, { desc = "DAP Widgets" })
      vim.keymap.set("n", "<leader>du", function()
        require("dapui").toggle({})
      end, { desc = "Dap UI" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end

      -- Setup Breakpoint text
      vim.fn.sign_define("DapBreakpoint", {
        text = "●", -- a large dot
        texthl = "DapBreakpointSign",
      })
    end,
  },
}
