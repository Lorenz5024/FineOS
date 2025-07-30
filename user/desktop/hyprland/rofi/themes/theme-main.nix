{ config, ... }:

{
  home.file.".config/rofi/themes/theme-main.rasi".text = ''
    * {
      background:         #${config.lib.stylix.colors.base00}B3;
      text:               #${config.lib.stylix.colors.base05};
      entry-background:   #${config.lib.stylix.colors.base02};

      prompt-background:  #${config.lib.stylix.colors.base0D};
      selected-element:   #${config.lib.stylix.colors.base08};

      width: 100%;
      height: 100%;
      font: "JetBrainsMono Nerd Font 20";
      
      background-color: transparent;

      margin: 0px;
      padding: 0px;
    }

    window {
        background-color: @background;

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
        background-color: @prompt-background;
    }

    entry {
        margin: 18px 18px 18px 0px;
        padding: 6px 16px;
        border-radius: 0px 10px 10px 0px;
        vertical-align: 0.5;
        background-color: @entry-background;
        text-color: @text;
    }

    listview {
        margin: 0px 24px 18px 24px;
        columns: 1;
        lines: 5;
    }

    element {
        background-color: transparent;
        text-color: @text;
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
      text-color: @selected-element;
      background-color: inherit;
    }

  '';
}
