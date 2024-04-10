#!/usr/bin/env -S just --justfile
# ^ A shebang isn't required, but allows a justfile to be executed
#   like a script, with `./justfile test`, for example.

hm-switch:
  home-manager switch --flake .#jponchon@n00085

nixos-rebuild:
  sudo nixos-rebuild switch --flake . 