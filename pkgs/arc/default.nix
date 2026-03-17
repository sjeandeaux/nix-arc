{ stdenvNoCC, fetchurl, undmg }:

stdenvNoCC.mkDerivation rec {
  pname = "arc";
  version = "1.138.3-77277";

  src = fetchurl {
    url = "https://releases.arc.net/release/Arc-${version}.dmg";
    hash = "sha256-N54v5iPtvowOiXtOM/TD6opO0tGVtrSl5obYbLBhrrA=";
  };

  nativeBuildInputs = [ undmg ];

  sourceRoot = ".";

  installPhase = ''
    mkdir -p "$out/Applications"
    cp -r Arc.app "$out/Applications/"
  '';

  meta = {
    description = "Arc browser by The Browser Company";
    homepage = "https://arc.net";
    platforms = [ "aarch64-darwin" "x86_64-darwin" ];
    mainProgram = "Arc";
  };
}
