{ stdenv, writeText }:

let
  generic = builtins.readFile ./vimrc/generic.vim;

in

''
  ${generic}
''
