{
  description = "tanui's NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-26.05 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Unstable nixpkgs for frequently updated packages
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Pinned nixpkgs for Teleport v16 (older release with required features)
    nixpkgs-teleport-16.url = "github:NixOS/nixpkgs/nixos-24.11";

    # Pre-commit hooks
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-teleport-16,
      pre-commit-hooks,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
      # Instantiate pinned nixpkgs with insecure package permission
      pkgs-teleport-16 = import nixpkgs-teleport-16 {
        inherit system;
        config = {
          allowUnfree = true;
          permittedInsecurePackages = [ "teleport-16.5.9" ];
        };
      };
    in
    {
      # Formatter for `nix fmt`
      formatter.${system} = pkgs.nixfmt;

      # Pre-commit hooks
      checks.${system} = {
        pre-commit-check = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixfmt.enable = true;
          };
        };
      };

      # Development shell with pre-commit
      devShells.${system}.default = pkgs.mkShell {
        inherit (self.checks.${system}.pre-commit-check) shellHook;
        buildInputs = self.checks.${system}.pre-commit-check.enabledPackages;
      };

      # Please replace my-nixos with your hostname
      nixosConfigurations.sava = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit pkgs-unstable pkgs-teleport-16;
        };
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./hosts/sava/configuration.nix
          ./modules
        ];
      };
    };
}
