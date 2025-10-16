-- init lua 
-- HyprCraft dotfiles 
-- Nvim hyprcraft init 
-- repository: https://github.com/zhaleff/hyprcraft 
-- author:


vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 0
vim.opt.sidescrolloff = 8
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argv(0) == "" then
      vim.api.nvim_echo({ { "HyprCraft", "Title" } }, true, {})
    end
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
        no_italic = false,
        no_bold = false,
        no_underline = false,
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = { "italic" },
          functions = { "bold" },
          keywords = { "bold" },
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        lsp_styles = {
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
          },
          inlay_hints = { background = true },
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        auto_integrations = true,
        integrations = {
          aerial = true,
          alpha = true,
          barbar = false,
          barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
          beacon = false,
          blink_cmp = { style = "bordered" },
          cmp = true,
          coc_nvim = false,
          colorful_winsep = { enabled = false, color = "red" },
          dashboard = true,
          diffview = true,
          dropbar = { enabled = true, color_mode = false },
          fidget = true,
          flash = true,
          gitsigns = true,
          grug_far = false,
          harpoon = false,
          headlines = false,
          hop = false,
          indent_blankline = { enabled = true, scope_color = "lavender", colored_indent_levels = false },
          leap = false,
          lsp_trouble = true,
          lsp_saga = false,
          mason = true,
          mini = { enabled = true, indentscope_color = "lavender" },
          neogit = true,
          neotest = false,
          neotree = false,
          noice = false,
          notify = false,
          nvim_surround = false,
          nvimtree = true,
          octo = false,
          overseer = false,
          rainbow_delimiters = true,
          render_markdown = true,
          telescope = { enabled = true },
          treesitter = true,
          treesitter_context = true,
          trouble = true,
          ts_rainbow = true,
          ts_rainbow2 = true,
          ufo = true,
          which_key = true,
          window_picker = false,
        },
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("pyright", {
        capabilities = capabilities,
        settings = { python = { analysis = { autoSearchPaths = true } } },
        single_file_support = true,
      })
      vim.lsp.enable("pyright", { ft = { "python" } })

      vim.lsp.config("ts_ls", { capabilities = capabilities, single_file_support = true })
      vim.lsp.enable("ts_ls", { ft = { "typescript", "javascript" } })

      vim.lsp.config("clangd", { capabilities = capabilities, single_file_support = true })
      vim.lsp.enable("clangd", { ft = { "c", "cpp" } })

      vim.lsp.config("html", { capabilities = capabilities, single_file_support = true })
      vim.lsp.enable("html", { ft = { "html" } })

      vim.lsp.config("cssls", { capabilities = capabilities, single_file_support = true })
      vim.lsp.enable("cssls", { ft = { "css", "scss" } })

      vim.lsp.config("emmet_ls", {
        capabilities = capabilities,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
        single_file_support = true,
      })
      vim.lsp.enable("emmet_ls")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,
            },
          },
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = { additional_args = { "--hidden" } },
        },
      })
      pcall(telescope.load_extension, "fzf")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          section_separators = { right = "", left = "" },
          component_separators = { left = "", right = "" },
          globalstatus = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 35, side = "left" },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
        },
        filters = { dotfiles = true },
        git = { enable = true, ignore = false },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua", "python", "javascript", "typescript", "c", "cpp", "go", "rust",
          "bash", "html", "css", "json", "yaml"
        },
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        fast_wrap = { map = "<M-e>" },
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        toggler = { line = "gcc", block = "gbc" },
        opleader = { line = "gc", block = "gb" },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
    
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        },
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
        current_line_blame = true,
        current_line_blame_opts = { delay = 300 },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup({
        modes = {
          diagnostics = { auto_open = false },
          lsp_definitions = { auto_open = false },
        },
      })
    end,
  },
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          header = {
            " ",
            " . _ . .__ . . __,--' ",
            " (_) ' /__\\ __,--' ",
            "' . ' . '| o|' ",
            " [IIII]`--.__ ",
            " | | `--.__ ",
            " | :| `--.__ ",
            " | | `--.__ ",
            "._,,.-,.__.'__`.___.,.,.-..,_.,.,.,-._..`--..",
            " ",
          },
          shortcut = {
            { desc = "Update", group = "Label", key = "u", action = "Lazy update", icon = "󰊳 " },
            { desc = "Files", group = "Label", key = "f", action = "Telescope find_files", icon = " " },
            { desc = "Explorer", group = "Label", key = "e", action = "NvimTreeToggle", icon = "󰙎 " },
            { desc = "Quit", group = "Label", key = "q", action = "qa", icon = "󰅚 " },
          },
        },
      })
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        preset = "modern",
      })
    end,
  },
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "Go to references" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", { desc = "Toggle diagnostics" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "Go to definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "Hover documentation" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "Rename symbol" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "Code action" })
  end,
})

vim.diagnostic.config({
  virtual_text = { prefix = "●", source = "if_many" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌵 ",
    },
  },
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "always" },
})
