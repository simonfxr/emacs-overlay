{ pkgs ? import <nixpkgs> { overlays = [ (import ../../default.nix) ]; } }:

let
  mkTestBuild = package: let
    emacsPackages = pkgs.emacsPackagesFor package;
    emacsWithPackages = emacsPackages.emacsWithPackages;
  in emacsWithPackages(epkgs: [ ]);

in {
  emacsUnstable = mkTestBuild pkgs.emacsUnstable;
  emacsGit = mkTestBuild pkgs.emacsGit;
  emacsGitNativeComp = mkTestBuild pkgs.emacsGitNativeComp;
  emacsPgtk = mkTestBuild pkgs.emacsPgtk;
  emacsPgtkNativeComp = mkTestBuild pkgs.emacsPgtkNativeComp;
  commercialEmacsGit = mkTestBuild pkgs.commercialEmacsGit;
  commercialEmacsGitNativeComp = mkTestBuild pkgs.commercialEmacsGitNativeComp;
}
