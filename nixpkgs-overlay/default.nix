self: super:

with super;

let 
    haxe = 
        with rec {
            version = "4.0.5";
            haxeTarLink = 
                "https://github.com/HaxeFoundation/haxe/releases/download/${version}/haxe-${version}-linux64.tar.gz";
            haxeTar = 
                builtins.fetchTarball {
                    url = haxeTarLink;
                    sha256 = "1q546drqc9snv4j4s1y61z4r3gz0hjrl66gly5s6r9c6z238b6r9";
                };
        };
        stdenv.mkDerivation {
            name = 
                "haxe-${version}";
            system = 
                "x86_64-linux";
            inherit version;
            src = 
                "${haxeTar}";
            nativeBuildInputs = 
                [
                    autoPatchelfHook
                ];
            unpackPhase = 
                false;
            buildInputs = 
                [
                    glibc
                    gcc-unwrapped
                    neko
                ];
            installPhase = 
                ''
                    mkdir -p $out/bin
                    cp -av $src/* $out/bin
                '';
            meta = 
                with stdenv.lib;
                {
                    description = "Haxe 4.0.5";
                    homepage = https://haxe.org/;
                    license = licenses.gnu;
                    maintainers = with stdenv.lib.maintainers; [ ];
                    platforms = [ "x86_64-linux" ];
                };
        };
in 
    {
        inherit haxe;
    }