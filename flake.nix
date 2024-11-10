{
  description = "Personal NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";
  };

  outputs = { self, nixpkgs, nixos-wsl, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nixos-wsl.nixosModules.default
        ./wsl.nix
        ./settings.nix
        ./apps-dev.nix
        { system.stateVersion = "24.05"; }
      ];
    };
  };
}
