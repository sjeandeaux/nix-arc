# nix-arc

Nix flake packaging [Arc browser](https://arc.net) for macOS.

## Usage

### As a flake input

```nix
{
  inputs = {
    nix-arc = {
      url = "github:sjeandeaux/nix-arc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

### Direct install

```bash
nix profile install github:sjeandeaux/nix-arc#arc
```

### Build

```bash
nix build github:sjeandeaux/nix-arc#arc --no-write-lock-file
```

## Integration with nix-darwin

Add `arc` to your overlay and packages:

```nix
# flake.nix
overlays = [
  (final: _prev: {
    inherit (nix-arc.packages.${system}) arc;
  })
];

# packages.nix
environment.systemPackages = [ pkgs.arc ];
```

## Supported platforms

- `aarch64-darwin`
- `x86_64-darwin`
