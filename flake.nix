{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    
    nur.url = "github:nix-community/NUR";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";  
    };

    stylix.url = "github:danth/stylix/release-24.11";

    nixvim.url = "github:grizimin/.nixvim";
  };

  outputs = { self, nixpkgs, home-manager, hyprpanel, nur, stylix, nixvim, ... }@inputs: 
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
        home-manager.nixosModules.home-manager
        stylix.nixosModules.stylix

        ./hosts/default/conf.nix

	{
	    environment.systemPackages = [
	    	inputs.nixvim.packages."x86_64-linux".default
	    ];
	}
      ];
    };

    homeConfigurations = {
      grizimin = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;  
        };
        modules = [ 
            stylix.homeManagerModules.stylix
            ./home/grizimin.nix 
        ];
      };
    };

  };
}
