{ config, ... }:

{
  home.file.".config/rofi/themes/theme-wallpaperpicker.rasi".text = ''
    *{
      background:         #${config.lib.stylix.colors.base00}B3;
      text:               #${config.lib.stylix.colors.base05};
      element-background:   #${config.lib.stylix.colors.base02};

      prompt-background:  #${config.lib.stylix.colors.base0D};
      selected-element:   #${config.lib.stylix.colors.base0F};

      background-color: transparent;
    }

    /* ---- Window ---- */
    window {
      background-color: @background;
      width:		      100%;
      height:                 27em;
      x-offset:               0px;
      y-offset:               0px;
      spacing:                0px;
      padding:                2px;
      margin:                 0px; 
      cursor:                 "default";
      location:               south;
      anchor:                 south;
      fullscreen:             false;
      enabled:                true;
    }

    /* ---- Mainbox ---- */
    mainbox {
        enabled:                true;
        orientation:            horizontal;
        padding:		8px;
        children:               [ "imagebox"];
        border-radius:          12px;
    }

    /* ---- Imagebox ---- */
    imagebox {
        orientation:            vertical;
        children:               [ "inputbar", "listbox"];
    }

    /* ---- Listbox ---- */
    listbox {
        spacing:                4px;
        orientation:            vertical;
        children:               [ "listview" ];
        border-radius:          10px;
        border:                 1px;
        border-color:           @active-background;
    }

    /* ---- Dummy ---- */
    dummy {
        background-color:       transparent;
    }

    prompt {
      background-color: @prompt-background;
      font: "JetBrainsMono Nerd Font 16";
      padding: 6px 16px;
      border-radius: 10px 0px 0px 10px;
      vertical-align: 0.5;
      text-style: bold;
    }

    /* ---- Inputbar ---- */
    inputbar {
        enabled:                true;
        text-color:             @foreground;
        spacing:                10px;
        padding:                8px;
        border-radius:          10px;
        border-color:           @foreground;
        children:               [ prompt, entry ];
        border:                 1px;
        border-color:           @active-background;
    }

    entry {
      font: "JetBrainsMono Nerd Font 16";
      enabled:                true;
      text-color:             @text;
      cursor:                 text;
      placeholder:            "Choose Wallpaper";
      placeholder-color:      inherit;
      background-color:	transparent;
      vertical-align:         0.5;
    }

    /* ---- Listview ---- */
    listview {
            enabled:				true;
            columns:                1;
            lines:		    10;
            spacing:                4px;
            dynamic:                true;
            cycle:                  true;
            scrollbar:              true;
            layout:                 horizontal;
            reverse:                false;
            fixed-height:           true;
            fixed-columns:          false;
            border-radius:          10px;
    }

    /* ---- Element ---- */
    element {
        enabled:                true;
        padding:                0em 2em;
        margin:                 2px;
        cursor:                 pointer;
        orientation: 		vertical;
        background-color:       transparent;
        border-radius:          10px;
        border:                 0px;
    }

    element selected {
        background-color:      @selected-element;
        text-color:            @foreground;
    }

    element-icon {
        text-color:            inherit;
        size:                  20em;
        cursor:                inherit;
    }

    element-text {
        font:                 "Fira Code SemiBold 12";
        text-color:           inherit;
        cursor:               inherit;
        horizontal-align:     0.5;
    }

    /*****----- Message -----*****/
    message {
        margin:				    20px 0px 0px 0px;
        border-radius: 			10px;
    }

    textbox {
        padding:                15px;
        text-color:             @foreground;
    }

    error-message {
        padding:                15px;
        border-radius:          20px;
        text-color:             @foreground;
    }
  '';
}
