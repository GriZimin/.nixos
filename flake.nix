{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    # Hyprpanel
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    
    # For community packages
    nur.url = "github:nix-community/NUR";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";  
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprpanel, nur, ... }@inputs: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit system;
        inherit inputs;
      };

        
      modules = [
        {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
        ./hosts/default/conf.nix
        ./modules/system/nvidia.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useUserPackages = true;
          home-manager.users.grizimin = import ./home/default.nix;
        }
      ];

    
    };
  };
}
