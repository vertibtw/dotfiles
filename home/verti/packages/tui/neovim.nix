{ pkgs, theme, ... }:
{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    withPerl = false;
    withNodeJs = false;
    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      nvim-treesitter
      telescope-nvim
      telescope-fzf-native-nvim
      which-key-nvim
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''require("gitsigns").setup()'';
      }
      neogit
      diffview-nvim
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require("catppuccin").setup({ flavour = "mocha" })
        '';
      }
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''require("lualine").setup({ options = { theme = "catppuccin-nvim" } })'';
      }
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = ''require("bufferline").setup()'';
      }
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''require("ibl").setup()'';
      }
      nvim-web-devicons
      nvim-autopairs
      nvim-surround
      comment-nvim
      vim-illuminate
      {
        plugin = alpha-nvim;
        type = "lua";
        config = ''
          local alpha = require("alpha")
          local dash = require("alpha.themes.dashboard")
          dash.section.header.val = vim.split([[${theme.editor-ascii}]], "\n", { trimempty = true }) -- this is the best way to split the string at newlines (shitty plugin cannot just put the whole text in, smh)
          dash.section.buttons.val = {
            dash.button("n", "  new file",      ":ene <BAR> startinsert<CR>"),
            dash.button("f", "  find file",     ":Telescope find_files<CR>"),
            dash.button("r", "  recent",        ":Telescope oldfiles<CR>"),
            dash.button("q", "  quit",          ":qa<CR>"),
          }
          dash.section.footer.val = "I use nvim btw"
          alpha.setup(dash.config)
        '';
      }
    ];
    initLua = ''
       vim.opt.number = true
       vim.opt.relativenumber = true
       vim.opt.tabstop = 4
       vim.opt.shiftwidth = 4
       vim.opt.expandtab = true
       vim.opt.cursorline = true
       vim.cmd.colorscheme("catppuccin")
       vim.g.mapleader = " "
       vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
       vim.keymap.set('n', '<F4>', require('telescope.builtin').colorscheme)
       vim.keymap.set('n', '<leader>gs', require('telescope.builtin').git_status)
       vim.keymap.set('n', '<leader>gb', require('telescope.builtin').git_branches)
       vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files)

       local cmp_lsp = require('cmp_nvim_lsp')
       local capabilities = cmp_lsp.default_capabilities()

       vim.lsp.config('clangd', {
         capabilities = capabilities,
         cmd = { "clangd" },
       })

       vim.lsp.config('lua_ls', {
         capabilities = capabilities,
         settings = { Lua = { hint = { enable = true } } },
       })

       vim.lsp.config('nil_ls', {
         capabilities = capabilities,
       })

       vim.lsp.enable({ 'clangd', 'lua_ls', 'nil_ls' })

       vim.lsp.inlay_hint.enable(true)

       vim.api.nvim_create_autocmd('LspAttach', {
         callback = function(args)
           local opts = { buffer = args.buf }
           vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
           vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
           vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
           vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
           vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
           vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
           vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
           vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
           vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
           vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end, opts)
         end,
       })

       -- for completion
       local cmp = require('cmp')
       cmp.setup({
         snippet = {
           expand = function(args) end, -- you don't have a snippet engine plugin yet; leave empty or add LuaSnip
         },
         mapping = cmp.mapping.preset.insert({
           ['<C-Space>'] = cmp.mapping.complete(),
           ['<CR>'] = cmp.mapping.confirm({ select = true }),
           ['<Tab>'] = cmp.mapping.select_next_item(),
           ['<S-Tab>'] = cmp.mapping.select_prev_item(),
         }),
         sources = cmp.config.sources({
           { name = 'nvim_lsp' },
           { name = 'path' },
         }, {
           { name = 'buffer' },
         }),
       })

       -- clang stuff
       vim.api.nvim_create_autocmd('BufWritePre', {
       pattern = { '*.c', '*.cpp', '*.h', '*.hpp' },
       callback = function()
         vim.lsp.buf.format({ async = false })
       end,
      })
    '';
    extraPackages = with pkgs; [
      lua-language-server
      nil
      ripgrep
      fd
      gcc
    ];
  };
}
