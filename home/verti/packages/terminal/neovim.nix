# emacs fucked up the indentation in this file, idk don't wanna fix it
{ pkgs, theme, ... } :
{
  programs.neovim = {
    enable = true;
    withRuby = false;
    withPython3 = false;
    withPerl = false;
    withNodeJs = false;

    plugins = with pkgs.vimPlugins; [
                # TODO configure lsp idk
                nvim-lspconfig
				nvim-cmp
				cmp-nvim-lsp
				cmp-buffer
				cmp-path

				mason-nvim
				mason-lspconfig-nvim 

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
