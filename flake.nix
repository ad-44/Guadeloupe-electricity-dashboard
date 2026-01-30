{
  description = "Python development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.11";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {inherit system; };
      python = pkgs.python313.withPackages (ps: [
        ps.python-lsp-server
        ps.numpy
        ps.pandas
        ps.ipython
        ps.openpyxl
        ps.altair
        ps.requests
        ps.itables
        ps.jupyter
        ]);
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          python
          quarto
          black
        ];
        
      };
    };
}
