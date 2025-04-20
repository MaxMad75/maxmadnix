{
  description = "MaxMadNix";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix";
  };

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    #host = "nixlap";
    profile = "intel";
    username = "maxmad";
  in {
    nixosConfigurations = {

      nixnuc = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          host = "nixnuc";
          inherit profile;
        };
        modules = [./profiles/intel];
      };
      
       nixlap = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          host = "nixlap";
          inherit profile;
        };
        modules = [./profiles/intel];
      };
      vm = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit username;
          #inherit host;
          inherit profile;
        };
        modules = [./profiles/vm];
      };
    };
  };
}
