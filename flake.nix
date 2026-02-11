{
  description = "ctrl — TypeScript monorepo dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = fn: nixpkgs.lib.genAttrs systems (system: fn {
        pkgs = nixpkgs.legacyPackages.${system};
      });
      devPackages = pkgs: with pkgs; [
        git
        gh
        bun
      ];
    in
    {
      devShells = forAllSystems ({ pkgs }: {
        default = pkgs.mkShell {
          packages = devPackages pkgs;
        };
      });

      packages = forAllSystems ({ pkgs }: {
        dev-env = pkgs.buildEnv {
          name = "ctrl-dev-env";
          paths = devPackages pkgs;
        };
      });
    };
}
