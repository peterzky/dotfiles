{pkgs, ...}:
{
  allowUnfree = true;
  overlays = [
    (import ../../nixos/overlays/package-overlay.nix)
    (import ../../nixos/overlays/python-overlay.nix)
    (import ../../nixos/overlays/env-overlay.nix)
  ];
}
