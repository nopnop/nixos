#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.
# See # See https://just.systems/man/en/

# Just switch home-manager configuration
default: hm-switch

# Build and activate the home-manager configuration: the default target.
hm-switch:
  home-manager switch --flake .#jponchon@n00085

# Build the home-manager configuration without activating it.
hm-build:
  home-manager build --flake .#jponchon@n00085

# Build the NixOS configuration without activating it.
nixos-build:
  sudo nixos-rebuild build --flake . 

# Build and activate the NixOS configuration.
nixos-switch:
  sudo nixos-rebuild switch --flake . 
