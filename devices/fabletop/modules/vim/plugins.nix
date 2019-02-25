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

  "pest.vim" = buildVimPlugin {
    name = "pest.vim";
    src = fetchgit {
      url = "https://github.com/pest-parser/pest.vim";
      rev = "79ef682b0a4ac6574e999daa048f313b9e7553ef";
      sha256 = "15kdqmvklnbb3dk3b1qfnkd0rhvdx9ywr36yin7ddmpzb3bzrx0k";
    };
    dependencies = [];
  };

}
