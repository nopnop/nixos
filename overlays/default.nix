# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  
    # https://github.com/NixOS/nixpkgs/pull/305026/files
    # pnpm = prev.nodejs_20.pkgs.pnpm.overrideAttrs (oldAttrs: rec {
    #   version = "9.0.2";
    #   name = "pnpm-${version}";
    #   src = prev.fetchurl {
    #     url = "https://registry.npmjs.org/pnpm/-/pnpm-9.0.2.tgz";
    #     sha512 = "i+3zHeQnBbl/+JMwu+F3lUrVcDqS+olL4PtNRbXfq1miH2WoQZrRyugt0W+sLUGow0N3XoDv59q22AsECNsv1g==";
    #   };
    # });

  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  unstable-packages = final: _prev: {
    unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
