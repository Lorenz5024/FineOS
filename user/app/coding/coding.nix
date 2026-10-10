{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # AI coding
    opencode

    gcc

    # Rust
    cargo
    rustc
  ];
}
