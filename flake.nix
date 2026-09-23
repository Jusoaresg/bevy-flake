{
  description = "Personal bevy flake";

  inputs = {
    nixpkgs.url = "https://channels.nixos.org/nixpkgs-unstable/nixexprs.tar.zst";
  };

  outputs = inputs: {
    templates.bevy = {
      path = ./templates;
      description = "Bevy Flake";
    };
  };
}
