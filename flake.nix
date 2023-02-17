{
description = "my project description";

inputs .nixpkgs .url = "github:NixOS/nixpkgs";
inputs .dream2nix .url = "github:nix-community/dream2nix";

outputs =
	{ self, nixpkgs, dream2nix }:
		dream2nix .lib .makeFlakeOutputs
		{
		systems = [ "x86_64-darwin" ];
		config .projectRoot = ./.;
		source = ./.;
		projects = ./projects.toml;
		}
		;
}
