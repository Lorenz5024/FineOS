{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # AI coding
    opencode

    # Rust
    cargo
    rustc
  ];
}
