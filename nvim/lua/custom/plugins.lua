local plugins = {
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "lua_ls",
        "clangd",
        "clang-format",
        "codelldb",
        "rust-analyzer",
        "jdtls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
    },

  {"rcarriga/nvim-notify"},
  {"MunifTanjim/nui.nvim"},
  {"roobert/activate.nvim",
    keys = {
    {
      "<leader>P",
      '<CMD>lua require("activate").list_plugins()<CR>',
      desc = "Plugins",
    },
  },
    dependencies = {
      { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim'}
      }
    },
  },
  {'andweeb/presence.nvim',
    enabled=true,
    lazy=false,
  },
  {'SmiteshP/nvim-navic',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
    enabled=true,
    lazy=false,
  },
  {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    -- configurations go here
    },
    enabled=true;
    lazy=false;
  },
  {
    'KadoBOT/nvim-spotify',
    dependencies = {
      'nvim-telescope/telescope.nvim'
    },
    config = function ()
      local spotify = require('nvim-spotify')

      spotify.setup {
        status = {
          update_interval = 10000,
          format = '%s %t by $a'
        }
      }
    end,
    enabled=true;
    lazy=false;
  },
  {
  "epwalsh/obsidian.nvim",
  version = "*",  -- recommended, use latest release instead of latest commit
  lazy = false,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal/school",
        path = "/Users/nithilgadde/Desktop/Nithil Vault/",
      },
    -- see below for full list of options 👇
      },
    },
  },
  {
    'MunifTanjim/nui.nvim',
    enabled=true,
    lazy=false,
  },
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled=true,
  lazy=false,
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
  },
  {
    "SmiteshP/nvim-navbuddy",
    enabled=true,
    lazy=false,
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "numToStr/Comment.nvim",
      "nvim-telescope/telescope.nvim"
     },
    },
    {
      "Exafunction/codeium.vim",
      enabled=true,
      lazy=false,
    },
 {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustacean"
    end
  },
  {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function(_, opts)
      local crates  = require('crates')
      crates.setup(opts)
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
      crates.show()
      require("core.utils").load_mappings("crates")
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    lazy = false,
    config = function(_, opts)
      require("nvim-dap-virtual-text").setup()
    end
  },
  {
  "luckasRanarison/nvim-devdocs",
  lazy = false,
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {}
  },
  {
    "gorbit99/codewindow.nvim",
    lazy = false,
    enabled = true,
    config = function()
      local codewindow = require('codewindow')
      codewindow.setup()
      codewindow.apply_default_keybinds()
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    enabled=true,
    lazy=false,
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true, -- or `opts = {}`
  },
  {
    'hrsh7th/cmp-cmdline',
    lazy = false,
    enabled = true,
  },
}
 
return plugins
