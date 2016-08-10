{ pkgs, fetchgit }:

let
  buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in {

  "vim-trailing-whitespace" = buildVimPlugin {
    name = "vim-trailing-whitespace";
    src = fetchgit {
      url = "https://github.com/bronson/vim-trailing-whitespace";
      rev = "d4ad27de051848e544e360482bdf076b154de0c1";
      sha256 = "1xrx9c8d4qwf38jc44a9szw195m8rfri9bsdcj701p9s9ral0l31";
    };
    dependencies = [];
  };

}
