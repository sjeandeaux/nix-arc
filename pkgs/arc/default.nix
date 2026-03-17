{ stdenvNoCC, fetchurl, undmg }:

stdenvNoCC.mkDerivation rec {
  pname = "arc";
  version = "1.138.3-77277";

  src = fetchurl {
    url = "https://releases.arc.net/release/Arc-${version}.dmg";
    hash = "sha256-1c5fc6q6rn46wsjv9dlms794x2paqgs36kkvi478rgpd4gk2z7ip=";
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
