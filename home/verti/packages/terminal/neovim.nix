# emacs fucked up the indentation in this file, idk don't wanna fix it
{ pkgs, ... } :
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
                  config = ''require("lualine").setup({ options = { theme = "catppuccin" } })'';
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
    ];

    initLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
      vim.opt.tabstop = 4
	  vim.opt.shiftwidth = 4
	  vim.opt.expandtab = true
	  vim.opt.cursorline = true

      vim.cmd.colorscheme("catppuccin")
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
