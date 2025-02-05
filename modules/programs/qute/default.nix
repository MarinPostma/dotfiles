{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    searchEngines = { DEFAULT = "https://google.com/search?q={}"; };
    settings = {
      content.javascript.clipboard = "access";
      colors.webpage.darkmode.enabled = true;
    };
  };
}
