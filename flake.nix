{
  description = "A Nix-flake-based Python development environment";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.x86_64-linux.default =
        pkgs.mkShell {
          venvDir = ".venv";
          packages =
            with pkgs; [ python313 ] ++
                       (with pkgs.python313Packages; [
                         pip
                         venvShellHook
                       ]);
        };
    };
}
