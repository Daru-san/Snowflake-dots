{pkgs, lib, config, inputs, ...}: let
    #Import custom css themes from Godiesc/firefox-one on github
  firefoxOne = pkgs.fetchgit {
    url = "https://github.com/Godiesc/firefox-one";
    rev = "974fee10ce0ebc9b4025b90bb18d05d74c46230f";
    sha256 = "0q4n013iinli1x9s2jwi091wi5qmmqxhljg7sk6sk5fsd6kzvn5p";
  };
in
{
  #Theme symlinks 
  home.file.".mozilla/firefox/daru/chrome" = {
    source = "${firefoxOne}/chrome";
    recursive = true;
  };

  programs.firefox = {
    enable = true;

    #Package, firefox-nightly
    package = inputs.firefox.packages.${pkgs.system}.firefox-nightly-bin;

    profiles = {
      daru = {
        #Name
        name = "daruFox";
        id = 14;

        preferencesStatus = "default";

        #Extensions(from NUR)
        extensions = with config.nur.repos.rycee.firefox-addons; [
          behave
          boring-rss
          cliget
          decentraleyes
          disable-javascript
          don-t-fuck-with-paste
          disconnect
          enhanced-github
          enhancer-for-youtube
          firefox-color
          violentmonkey
          github-file-icons
          gitako-github-file-tree
          i-dont-care-about-cookies
          hover-zoom-plus
          image-search-options
          keepassxc-browser
          multi-account-containers
          no-pdf-download
          re-enable-right-click
          simplelogin
          skip-redirect
          sponsorblock
          stylus
          terms-of-service-didnt-read
          temporary-containers
          translate-web-pages
          ublock-origin
          unpaywall
          web-archives
          widegithub
          tabcenter-reborn
        ];

        #Make this profile the default
        isDefault = true;

        #Containers
        constainers = {
          general = {
            color = "blue";
            id = 1;
            icon = "fruit";
          };
          shopping = {
            color = "pink";
            id = 2;
            icon = "cart";
          };
          coding = {
            color = "green";
            id = 3;
            icon = "chill";
          };
          space = {
            color = "purple";
            id = "77";
            icon = "vacaction";
          };
          social = {
            color = "red";
            id = 4;
            icon = "pet";
          };
          misc = {
            color = "yellow";
            id = 69;
            icon = "circle";
          };
        };
        #Search engines
        search = {
          #Make Brave and StartPage defaults
          default = "Brave Search";
          privateDefault = "StartPage";

          #The order they're in
          order = [
            "Brave Search"
            "StartPage"
            "DuckDuckGo"
            "My NixOS"
            "Nix Packages"
            "Nix Options"
            "Home Manager"
            "Google"
          ];

          #Force apply configs
          force = true;

          #Add custom search engines and modify existing ones
          engines = {
            
            #Brave search
            "Brave Search" = {
              urls = [
              {template = "https://search.brave.com/search?q={searchTerms}";}
              ];
              iconUpdateURL = "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
              updateInterval = 24 * 60 * 60 * 1000;
              definedAliases = ["@br"];
            };
              
            #StartPage
            "StartPage" = {
              urls = [
                {template = "https://www.startpage.com/sp/search?query={searchTerms}";}
              ];
              icon = "https://www.startpage.com/sp/cdn/favicons/favicon--default.ico";
              definedAliases = ["@sp"];
            };

            #Give google an alias
            "Google" = {
              metaData = {
                alias = "@g";
              };
            };

            #Give DuckDuckGo an alias
            "DuckDuckGo" = {
              metaData = {
                alias = "@dg"
              };
            };

            #Disable Bing
            "Bing" = {
              metaData = {
                hidden = true;
              };
            };

            #Disable Amazon
            "Amazon.com" {
              metaData = {
                hidden = true;
              };
            };

            #Add the NixOS wiki
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              iconUpdateURL = "https://nixos.wiki/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };

            #Nix packages and options from search.nixos.org
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                  ];
               }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            "Nix Options" = {
              urls = [{
                template = "https://search.nixos.org/options";
                params = [
                  { name = "type"; value = "options"; }
                  { name = "query"; value = "{searchTerms}"; }
                  ];
               }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@no" ];
            };

            #Similiar to search.nixos.org but with more info
            "My NixOS" = {
                urls = [
                {template = "https://mynixos.com/search?q={searchTerms}";}
                ];
                icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/white.svg";;
                definedAliases = ["mn" "@nx"];
              };

            #Home manager search
            "Home Manager" = {
              urls = [
                {template = "https://mipmip.github.io/home-manager-option-search/?query={searchTerms}";}
              ];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@hm"];
            };
          };
        };

        #Settings(in user.js)
        settings = {
          "browser.disableResetPrompt" = true;
          "browser.shell.checkDefaultBrowser" = false;
          "browser.shell.defaultBrowserCheckCount" = 1;
          "dom.security.https_only_mode" = true;
          "identity.fxaccounts.enabled" = true;
          "privacy.trackingprotection.enabled" = true;
          "signon.rememberSignons" = true;
          "browser.backspace_action" = 0;
          "browser.bookmarks.showMobileBookmarks" = false;
          "browser.download.panel.shown" = false;
          "browser.download.useDownloadDir" = false;
          "browser.newtabpage.activity-stream.feeds.section.highlights" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" =false;
          "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
          "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.search.suggest.enabled" = false;
          "browser.toolbars.bookmarks.visibility" = "always";
          "browser.tabs.warnOnClose" = true;
          "browser.startup.page" = 3;
          "browser.translations.panelShown" = true;
          "browser.urlbar.quicksuggest.scenario" = "history";
          "browser.urlbar.suggest.bookmark" = false;
          "browser.urlbar.suggest.history" = false;
          "browser.urlbar.suggest.topsites" = false;

          "gfx.webrender.all" = true;
          "layers.acceleration.force-enabled" = true;

          "privacy.clearOnShutdown.cache" = true;
          "privacy.clearOnShutdown.cookies" = false;
          "privacy.clearOnShutdown.downloads" = false;
          "privacy.clearOnShutdown.history" = true;
          "privacy.clearOnShutdown.sessions" = false;

          "privacy.donottrackheader.enabled" = true;
          "svg.context-properties.content.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

          "layout.css.color-mix.enabled" = true;
          "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
          "layout.css.backdrop-filter.enabled" = true;

          "privacy.userContext.enabled" = true;
          "privacy.userContext.ui.enabled" = true;
          "privacy.userContext.longPressBehavior" = 2;

          #Firefox-one configs
          "firefoxone.rhythm_sound_tab" = true;
          "firefoxone.selected_tab_gradient_border" = true;
          "firefoxone.style_without_leftsidebar" = false;
          "firefoxone.tree_tabs_style" = false;
          "firefoxone.without-default-colors" = true;
          "firefoxone.main-image" = false;
          
        };
      };
    };
  };
}
