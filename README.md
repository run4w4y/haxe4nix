# haxe4nix
Example usage in the nix-shell:
```nix
{ pkgsPath ? <nixpkgs> }:

with rec { 
    haxe4nix = 
        (import pkgsPath {}).fetchFromGitHub {
            owner = "run4w4y";
            repo = "haxe4nix";
            rev = "caf2123e19d4252c3d4510470afcf4a8820404d1";
            sha256 = "1f7nh7s9nsa7z428w41i7hmxzbyzh7d553m9pshm4yv9xphh3vdn";
        };
    pkgsOverlay = 
        import "${haxe4nix}/nixpkgs-overlay";
    pkgs = 
        import pkgsPath { overlays = [ pkgsOverlay ]; };
};
with pkgs;

mkShell {
    buildInputs = 
        [ 
            git 
            haxe
        ];
}
```
