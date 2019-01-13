{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  oxyclean = (
    with rec {
      oxycleanSource = pkgs.lib.cleanSource ../.;
      oxycleanBasic  = self.callCabal2nix "oxyclean" oxycleanSource { };
    };
    overrideCabal oxycleanBasic (old: {
    })
  );
}
