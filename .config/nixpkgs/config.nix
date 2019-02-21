{pkgs, ...}:
let
  c = import <nixpkgs/nixos> {};
in
c.config.nixpkgs.config
