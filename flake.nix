{
description = "my project description";

inputs .nixpkgs .url = "github:NixOS/nixpkgs";
inputs .dream2nix .url = "github:nix-community/dream2nix?rev=77dbc655cda5cb00c85b99aed62aefb0edfa0f48";

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
