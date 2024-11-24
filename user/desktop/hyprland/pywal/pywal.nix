{ config, ... }:

{
  home.file = {
    ".config/wal/templates/".source = ../../../wal/templates;
  };
}
