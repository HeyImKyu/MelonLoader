{
  description = ''
    next-gen framework for building desktop widgets using Python
    (check the rewrite branch for progress)
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    utils,
    ...
  }:
  let
    pkgsConfig = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-sdk-6.0.428"
        "dotnet-runtime-6.0.36"
      ];
    };
  in
  utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        system = system;
        config = pkgsConfig;
      };
    in {
      formatter = pkgs.nixfmt-rfc-style;
      packages = {
        default = pkgs.callPackage ./melonloader.nix {};
      };
    }
  );
}

