{
  description = "Personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nix-on-droid = {
      url = "github:nix-community/nix-on-droid/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixos-wsl, nix-on-droid, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        nixos-wsl.nixosModules.default
        ./wsl.nix
      ];
    };

    nixOnDroidConfigurations.default = nix-on-droid.lib.nixOnDroidConfiguration {
      pkgs = import nixpkgs { system = "aarch64-linux"; };

      modules = [
        ./nix-on-droid.nix
      ];
    };
  };
}
