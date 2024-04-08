{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    monorepo.url = "path:///home/user/code/monorepo";

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, monorepo, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
    
      nixosConfigurations.default = nixpkgs.lib.nixosSystem {
          specialArgs = {inherit inputs;};
          modules = [ 
            ./configuration.nix
            # inputs.home-manager.nixosModules.default
            # ({ pkgs, ... }: {
            #   nixpkgs.overlays = [ rust-overlay.overlays.default ];
            #   environment.systemPackages = [ pkgs.rust-bin.stable.latest.default ];
            # })
          ];
        };

    };
}
