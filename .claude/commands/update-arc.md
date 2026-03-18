Update Arc browser to a new version.

Usage: /update-arc <version>
Example: /update-arc 1.140.0-77500

Steps:
1. Fetch the SRI hash for the new DMG:
   `nix store prefetch-file --hash-type sha256 --json "https://releases.arc.net/release/Arc-$ARGUMENTS.dmg" | jq -r '.hash'`
3. Update `version` and `hash` in `pkgs/arc/default.nix`
4. Build and verify:
   - `nix build .#arc --no-write-lock-file`
   - `codesign -v result/Applications/Arc.app` (must produce no output)
5. Commit and push
6. Update flake.lock in dotfiles:
   `cd /Users/stephanejeandeaux/git/dotfiles/nix && nix flake update nix-arc`
7. Commit flake.lock in dotfiles
