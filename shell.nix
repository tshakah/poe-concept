with import <nixpkgs> { };
let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in
stdenv.mkDerivation rec {
  name = "env";
  env = buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    elixir_1_15
    elixir_ls
    sqlite
    inotify-tools
    watchexec
    mix2nix
  ];
}
