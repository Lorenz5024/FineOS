{ config, ... }:

{

  home.file = {
    ".config/rofi/themes/theme-main.rasi".text = ''
      * {
          background: #${config.lib.stylix.colors.base00};
          base-transparent: #1e1e2e70;
          text: #cdd6f4;
          surface0: #313244;

          mauve: #cba6f7;
          blue: #89b4fa;
          red: #f38ba8;

          width: 100%;
          height: 100%;
          font: "JetBrainsMono Nerd Font 20";
          
          background-color: transparent;
          text-color: @text;

          margin: 0px;
          padding: 0px;
      }

      window {
          background-color: @background;

          /*
          border: 2px;
          border-color: @blue;
          border-radius: 10px;
          */

          height: 100%;
          width: 18em;

          location: west;
          anchor: west;
      }

      inputbar {
          children: [prompt,entry];
          margin: 16px 18px 12px 18px;
      }

      prompt {
          font: "JetBrainsMono Nerd Font 24";
          margin: 18px 0px 18px 18px;
          padding: 6px 16px;
          border-radius: 10px 0px 0px 10px;
          vertical-align: 0.5;
          text-style: bold;
          background-color: @blue;
      }

      entry {
          margin: 18px 18px 18px 0px;
          padding: 6px 16px;
          border-radius: 0px 10px 10px 0px;
          vertical-align: 0.5;
          background-color: @surface0;
      }

      listview {
          margin: 0px 24px 18px 24px;
          columns: 1;
          lines: 5;
      }

      element {
          background-color: transparent;
          border-radius: 5px;
          margin: 1px 0px;
          padding: 4px 8px;
      }

      element-icon {
          size: 25px;
      }

      element-text {
       background-color: inherit;
       text-color: inherit;
      }

      element selected {
          text-color: @red;
      }

    '';
  };
}