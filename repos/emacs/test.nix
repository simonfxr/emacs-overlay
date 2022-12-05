{ pkgs ? import <nixpkgs> { overlays = [ (import ../../default.nix) ]; } }:

let
  mkTestBuild = package: let
    emacsPackages = pkgs.emacsPackagesFor package;
    emacsWithPackages = emacsPackages.emacsWithPackages;
  in emacsWithPackages(epkgs: [ ]);

in {
  emacsUnstable = mkTestBuild pkgs.emacsUnstable;
  emacsNext = mkTestBuild pkgs.emacsNext;
  emacsGit = mkTestBuild pkgs.emacsGit;
  emacsPgtk = mkTestBuild pkgs.emacsPgtk;
  emacsIgc = mkTestBuild pkgs.emacs-igc;
}
