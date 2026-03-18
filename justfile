update VERSION:
    #!/usr/bin/env bash
    set -euo pipefail
    HASH=$(nix store prefetch-file --hash-type sha256 --json "https://releases.arc.net/release/Arc-{{VERSION}}.dmg" | jq -r '.hash')
    sd 'version = "[^"]*"' 'version = "{{VERSION}}"' pkgs/arc/default.nix
    sd 'hash = "[^"]*"' "hash = \"$HASH\"" pkgs/arc/default.nix
    echo "Updated to {{VERSION}} with hash $HASH"
    nix build .#arc --no-write-lock-file
    codesign -v result/Applications/Arc.app && echo "Signature OK"
