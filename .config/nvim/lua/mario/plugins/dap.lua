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

      dap.adapters["pwa-node"] = {
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
      }
      dap.adapters["node"] = function(cb, config)
        if config.type == "node" then
          config.type = "pwa-node"
        end
        local a = dap.adapters["pwa-node"]
        if type(a) == "function" then
          a(cb, config)
        else
          cb(a)
        end
      end

      dap.configurations.typescript = {
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
      }
      dap.configurations.javascript = dap.configurations.typescript

      dap.listeners.before.attach.dapui_config = function() ui.open() end
      dap.listeners.before.launch.dapui_config = function() ui.open() end
      dap.listeners.before.event_terminated.dapui_config = function() ui.close() end
      dap.listeners.before.event_exited.dapui_config = function() ui.close() end

      vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpointSign" })
    end,
    keys = {
      {
        "<space>?",
        function() require("dapui").eval(nil, { enter = true }) end,
        desc = "Eval var under cursor",
      },
      {
        "<leader>db",
        function() require("dap").toggle_breakpoint() end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dB",
        function()
          require("dap").list_breakpoints()
          vim.cmd("copen")
        end,
        desc = "List Breakpoints",
      },
      {
        "<leader>dc",
        function() require("dap").continue() end,
        desc = "Run/Continue",
      },
      {
        "<leader>dC",
        function() require("dap").run_to_cursor() end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dg",
        function() require("dap").goto_() end,
        desc = "Go to Line (No Execute)",
      },
      {
        "<leader>di",
        function() require("dap").step_into() end,
        desc = "Step Into",
      },
      {
        "<leader>dj",
        function() require("dap").down() end,
        desc = "Down",
      },
      {
        "<leader>dk",
        function() require("dap").up() end,
        desc = "Up",
      },
      {
        "<leader>dl",
        function() require("dap").run_last() end,
        desc = "Run Last",
      },
      {
        "<leader>do",
        function() require("dap").step_out() end,
        desc = "Step Out",
      },
      {
        "<leader>dO",
        function() require("dap").step_over() end,
        desc = "Step Over",
      },
      {
        "<leader>dP",
        function() require("dap").pause() end,
        desc = "Pause",
      },
      {
        "<leader>dr",
        function() require("dap").repl.toggle() end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function() require("dap").session() end,
        desc = "Session",
      },
      {
        "<leader>dt",
        function()
          require("dap").terminate()
          vim.defer_fn(function() require("dapui").close({}) end, 100)
        end,
        desc = "Terminate",
      },
      {
        "<leader>dw",
        function() require("dap.ui.widgets").hover() end,
        desc = "DAP Widgets",
      },
      {
        "<leader>du",
        function() require("dapui").toggle({}) end,
        desc = "Dap UI",
      },
    },
  },
}
