{
  description = "Personal NixOS configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";

  outputs = { self, nixpkgs, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ /etc/nixos/configuration.nix ./apps-dev.nix ./settings.nix ] ;
    };
  };
}
