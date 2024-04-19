{
  programs.ncspot = {
    enable = true;
    settings = {
      gapless = true;
      shuffle = true;
      use_nerdfont = true;
      notify = true;
      repeat = "playlist";
      theme = {
        background = "#191414";
        primary = "#FFFFFF";
        secondary = "light black";
        title = "#1DB954";
        playing = "#1DB954";
        playing_selected = "#1ED760";
        playing_bg = "#191414";
        highlight = "#FFFFFF";
        highlight_bg = "#484848";
        error = "#FFFFFF";
        error_bg = "red";
        statusbar = "#191414";
        statusbar_progress = "#1DB954";
        statusbar_bg = "#1DB954";
        cmdline = "#FFFFFF";
        cmdline_bg = "#191414";
        search_match = "light red";
      };
    };
  };
}
