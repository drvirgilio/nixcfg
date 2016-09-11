{ pkgs }:

let

  vimrc = pkgs.callPackage ./vimrc.nix {};
  plugins = pkgs.callPackage ./plugins.nix {};

in
{
  customRC = vimrc;
  vam = {
    knownPlugins = pkgs.vimPlugins // plugins;

    pluginDictionaries = [

#Plugin 'gmarik/vundle'
#Plugin 'idris-hackers/idris-vim'
#Plugin 'jnwhiteh/vim-golang'

#Plugin 'vim-scripts/Vim-R-plugin'
#Plugin 'verilog_systemverilog.vim'
#Plugin 'screen.vim'

    { name = "idris-vim"; }
    { name = "The_NERD_tree"; }
    { name = "vim-go"; }
    { name = "vim-nix"; }
    { name = "vim-trailing-whitespace"; }
    { name = "youcompleteme"; }
    { name = "rust-vim"; }

    ];
  };
}
