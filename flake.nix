{
  description = "Nix package for Arc browser (macOS)";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self, nixpkgs }:
    let
      systems = [ "aarch64-darwin" "x86_64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          arc = pkgs.callPackage ./pkgs/arc { };
          default = self.packages.${system}.arc;
        }
      );

      overlays.default = final: _prev: {
        arc = final.callPackage ./pkgs/arc { };
      };
    };
}
