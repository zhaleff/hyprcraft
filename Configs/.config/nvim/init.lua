-- init.lua
-- repository: https://github.com/zhaleff/hyprcraft
-- author: 
-- LICENCE: MIT

-- === ===
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- === General options  ===
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
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.linebreak = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.pumblend = 10
vim.opt.winblend = 10
vim.opt.splitkeep = "screen"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.hlsearch = false

-- === Nvim Lazy ===
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- === Plugins ===
require("lazy").setup({
  -- === Theme: Catppuccin ===
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = false,
        show_end_of_buffer = false,
        term_colors = true,
        dim_inactive = { enabled = true, percentage = 0.15 },
        styles = {
          comments = { "italic" },
          functions = { "bold" },
          keywords = { "italic" },
          variables = { "italic" },
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = { enabled = true },
          treesitter = true,
          dashboard = true,
          which_key = true,
          indent_blankline = { enabled = true, scope_color = "lavender" },
          mini = { enabled = true },
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = { "italic" },
              warnings = { "italic" },
              information = { "italic" },
            },
            underlines = {
              errors = { "underline" },
              hints = { "undercurl" },
              warnings = { "underline" },
              information = { "underline" },
            },
          },
        },
      })
      vim.cmd.colorscheme("catppuccin")
    end,
  },

  -- === lsp base ===
  { "neovim/nvim-lspconfig" },

  -- === Telescope ===
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "  ",
          selection_caret = "  ",
          layout_strategy = "horizontal",
          layout_config = { prompt_position = "top", height = 0.9, width = 0.9 },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
        pickers = {
          find_files = { hidden = true },
          live_grep = { additional_args = { "--hidden", "--glob=!.git/" } },
        },
      })
      telescope.load_extension("fzf")
    end,
  },

  -- === lualine ===
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          globalstatus = true,
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            "branch",
            "diff",
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                info = " ",
                hint = "󰌶 ",
              },
            },
          },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- === nvim tree ===
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        view = { width = 35, side = "left", adaptive_size = true },
        renderer = {
          group_empty = true,
          highlight_git = true,
          icons = { show = { file = true, folder = true, folder_arrow = true, git = true } },
        },
        filters = { dotfiles = true, custom = { "^.git$" } },
        git = { enable = true, ignore = false },
        update_focused_file = { enable = true, update_root = false },
      })
    end,
  },

  -- === Treesitter ===
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html", "css", "javascript", "typescript",
          "lua", "python", "bash", "vue", "svelte",
        },
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
      })
    end,
  },

  -- === Autopairs ===
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        fast_wrap = { map = "<M-e>" },
      })
    end,
  },

  -- === Comment ===
  { "numToStr/Comment.nvim", config = true },

  -- === cmp + luasnip ===
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp", priority = 1000 },
          { name = "luasnip", priority = 750 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 250 },
        },
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
            symbol_map = { Emmet = "Emmet" },
          }),
        },
      })
    end,
  },

  -- === bufferline ===
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          diagnostics = "nvim_lsp",
          offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1 } },
          separator_style = "thin",
          indicator = { style = "underline" },
          hover = { enabled = true, delay = 200, reveal = { "close" } },
        },
      })
    end,
  },

  -- === git ===
  { "lewis6991/gitsigns.nvim", config = true },

  -- === Trouble ===
  { "folke/trouble.nvim", config = true },

  -- === indent-blankline ===
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
  },

  -- === Dashboard ===
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local hyprcraft = [[
_____________________                              _____________________
`-._:  .:'   `:::  .:\           |\__/|           /::  .:'   `:::  .:.-'
    \      :          \          |:   |          /         :       /    
     \     ::    .     `-_______/ ::   \_______-'   .      ::   . /      
      |  :   :: ::'  :   :: ::'  :   :: ::'      :: ::'  :   :: :|       
      |     ;::         ;::         ;::         ;::         ;::  |       
      |  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:::  .:'   `:|       
      /     :           :           :           :           :    \       
     /______::_____     ::    .     ::    .     ::   _____._::____\      
                   `----._:: ::'  :   :: ::'  _.----'                    
                          `--.       ;::  .--'                           
                              `-. .:'  .-'                               
                                 \    / :HyprCraft:                            
                                  \  /                                   
                                   \/                                     
      ]]

      require("dashboard").setup({
        theme = "doom",
        config = {
          header = vim.split(hyprcraft, "\n"),
          center = {
            { icon = " ", desc = "NvimTree        ", key = "e", action = "NvimTreeToggle" },
            { icon = " ", desc = "Find Files      ", key = "f", action = "Telescope find_files" },
            { icon = " ", desc = "Recent Files    ", key = "r", action = "Telescope oldfiles" },
            { icon = " ", desc = "Live Grep       ", key = "g", action = "Telescope live_grep" },
            { icon = "󰚰 ", desc = "Update Plugins  ", key = "u", action = "Lazy update" },
            { icon = "󰩈 ", desc = "Quit            ", key = "q", action = "qa" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { "", "HyprCraft 2025  •  " .. stats.count .. " plugins loaded in " .. ms .. "ms" }
          end,
        },
      })
    end,
  },

  -- === Which key ===
  {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({ preset = "helix" })
    end,
  },

  -- === emmet-nvim ===
  { "mattn/emmet-vim" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  lua_ls = { settings = { Lua = { diagnostics = { globals = { "vim" } } } } },
  pyright = {},
  tsserver = {},
  html = {},
  cssls = {},
  bashls = {},
  volar = {},
  svelte = {},
}


local server_map = {
  lua = "lua_ls",
  python = "pyright",
  javascript = "tsserver",
  typescript = "tsserver",
  javascriptreact = "tsserver",
  typescriptreact = "tsserver",
  html = "html",
  css = "cssls",
  bash = "bashls",
  vue = "volar",
  svelte = "svelte",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = vim.tbl_keys(server_map),
  callback = function(args)
    local server = server_map[vim.bo[args.buf].filetype]
    if server then
      vim.lsp.enable(server, { bufnr = args.buf })
    end
  end,
})

-- === KEYMAPS GLOBALES ===
local wk = require("which-key")

wk.add({
  { "<leader>e", ":NvimTreeToggle<CR>", desc = "Explorer" },

  { "<leader>f", group = "Find" },
  { "<leader>ff", ":Telescope find_files<CR>", desc = "Files" },
  { "<leader>fg", ":Telescope live_grep<CR>", desc = "Grep" },
  { "<leader>fb", ":Telescope buffers<CR>", desc = "Buffers" },
  { "<leader>fo", ":Telescope oldfiles<CR>", desc = "Old Files" },
  { "<leader>fh", ":Telescope help_tags<CR>", desc = "Help" },

  { "<leader>w", ":w<CR>", desc = "Save" },
  { "<leader>q", ":q<CR>", desc = "Quit" },

  { "<leader>b", group = "Buffer" },
  { "<leader>bd", ":bd<CR>", desc = "Delete" },

  { "<leader>x", group = "Trouble" },
  { "<leader>xd", ":Trouble diagnostics toggle<CR>", desc = "Diagnostics" },
  { "<leader>xl", ":Trouble loclist toggle<CR>", desc = "Loclist" },
  { "<leader>xq", ":Trouble quickfix toggle<CR>", desc = "Quickfix" },
})

-- Navegación entre buffers
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear Search" })

-- === LSP: KEYMAPS POR BUFFER ===
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    wk.add({
      { "gd", vim.lsp.buf.definition, desc = "Go to Definition", buffer = buf },
      { "K", vim.lsp.buf.hover, desc = "Hover", buffer = buf },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action", buffer = buf },
      { "<leader>rn", vim.lsp.buf.rename, desc = "Rename", buffer = buf },
    }, { buffer = buf })
  end,
})

-- === diagnosis  ===
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌶",
    },
  },
  float = { border = "rounded" },
})

vim.g.user_emmet_install_global = 0

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascriptreact", "typescriptreact", "vue", "svelte" },
  command = "EmmetInstall",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "javascriptreact", "typescriptreact", "vue", "svelte" },
  callback = function()
    vim.keymap.set("i", "<C-y>,", "<Plug>(emmet-expand-abbr)", { buffer = true })
    vim.keymap.set("i", ",", function()
      local line = vim.api.nvim_get_current_line()
      local col = vim.api.nvim_win_get_cursor(0)[2]
      if line:sub(1, col):match("[%w%-%]>$") then
        return "<C-y>,"
      else
        return ","
      end
    end, { expr = true, buffer = true })
  end,
})
