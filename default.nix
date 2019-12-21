{ pkgsPath ? <nixpkgs> }:

with import pkgsPath { overlays = [ (import ./nixpkgs-overlay) ]; };

let
    packages = [ haxe ];
in
    mkShell {
        buildInputs = packages;

        shellHook = ''
            export TERM=xterm-256color
            # alias haxe=${haxe}/haxe
            # alias haxelib=${haxe}/haxelib
        '';
    }