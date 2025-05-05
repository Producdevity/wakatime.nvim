# wakatime.nvim

[![Neovim](https://wakatime.com/static/img/Neovim-supported-brightgreen.svg)](https://github.com/producdevity/wakatime.nvim#installation)
[![Coding time tracker](https://wakatime.com/badge/github/producdevity/wakatime.nvim.svg)](https://wakatime.com/badge/github/producdevity/wakatime.nvim)

[WakaTime](https://wakatime.com/) is an open-source tool for metrics, insights, and time tracking automatically generated from your programming activity. This plugin, `wakatime.nvim`, is **not the official WakaTime plugin** but a complete rewrite in Lua specifically for Neovim.

## About This Plugin

This project is a full rewrite of the original [vim-wakatime](https://github.com/wakatime/vim-wakatime) plugin, which was written in Vimscript. The rewrite in Lua for Neovim was undertaken for the following reasons:

- **Performance and Modernity**: Lua is Neovim's native scripting language, offering better performance and integration with Neovim's API compared to Vimscript.
- **Maintainability**: Lua code is generally easier to read and maintain, leveraging modern programming paradigms.
- **Neovim-Specific Features**: This rewrite takes advantage of Neovim's async capabilities and Lua-specific APIs for a more seamless experience tailored to Neovim users.
- **Community Contribution**: To provide an alternative implementation that may better suit Neovim users who prefer Lua-based plugins.

**Note**: For the official WakaTime plugin supporting both Vim and Neovim with Vimscript, please refer to [vim-wakatime](https://github.com/wakatime/vim-wakatime).

## Installation

1. **Using Lazy.nvim (Recommended)**: Add the following to your plugin configuration file.

   ```lua
   return {
     "producdevity/wakatime.nvim",
     lazy = false,
     opts = {
       debug = false, -- Enable for verbose logging if needed
       -- Other configuration options can be set here
     },
   }
   ```

   Then run :Lazy sync to install the plugin.

2. Other Plugin Managers: You can also use other Neovim plugin managers like packer.nvim or manual installation by cloning the repository into your Neovim runtimepath.

- **Using Packer.nvim**: Add the following to your `init.lua` or `plugins.lua` file.

  ```lua
  use {
    "producdevity/wakatime.nvim",
    config = function()
      require("wakatime").setup({
        debug = false, -- Enable for verbose logging if needed
        -- Other configuration options can be set here
      })
    end,
  }
  ```

Then run `:PackerSync` to install the plugin.

- **Using Manual Installation**: Clone the repository into your Neovim runtimepath.

```bash
mkdir -p ~/.local/share/nvim/site/pack/plugins/start
cd ~/.local/share/nvim/site/pack/plugins/start
git clone https://github.com/producdevity/wakatime.nvim.git
```

3. **Restart Neovim**: After installation, restart Neovim to load the plugin.

4. **API Key Setup**: If this is the first WakaTime plugin on your machine, run :WakaTimeApiKey inside Neovim, enter your [API Key](https://wakatime.com/api-key), and press Enter.

5. **Usage**: Use Neovim as usual, and your coding activity will be displayed on your [WakaTime dashboard](https://wakatime.com/dashboard).

## Screen Shots

![Project Overview](https://wakatime.com/static/img/ScreenShots/Screen-Shot-2016-03-21.png)

## Commands

- `:WakaTimeApiKey` - set or change the api key saved in your `~/.wakatime.cfg`
- `:WakaTimeDebugEnable` - enable debug mode (may slow down Vim so disable when finished debugging)
- `:WakaTimeDebugDisable` - disable debug mode
- `:WakaTimeScreenRedrawEnable` - enable screen redraw to prevent artifacts (only for Vim < 8.0)
- `:WakaTimeScreenRedrawEnableAuto` - redraw screen when plugin takes too long (only for Vim < 8.0)
- `:WakaTimeScreenRedrawDisable` - disable screen redraw
- `:WakaTimeToday` - echo your total coding activity for Today

The `wakatime.nvim` plugin automatically downloads and updates [wakatime-cli][wakatime-cli] in your `$WAKATIME_HOME/.wakatime/` folder.
WakaTime plugins also share a common [$WAKATIME_HOME/.wakatime.cfg config file][wakatime-cli-config].
`$WAKATIME_HOME` defaults to your `$HOME` folder.

## Troubleshooting

Run `:WakaTimeDebugEnable` in Vim then run this Terminal command:

`tail -f ~/.wakatime/wakatime.log`

Enabling Debug Mode writes Vim Script errors to your Vim Status Bar and tells [wakatime-cli][wakatime-cli] to write verbose logs to `$WAKATIME_HOME/.wakatime/wakatime.log`.

Debug mode can make it hard to find the real error because of all the extra logging, so also try disabling Debug Mode while tailing `~/.wakatime/wakatime.log` and editing files in Vim.
With Debug Mode enabled, the plugin sends data synchronously so disable it when finished debugging with `:WakaTimeDebugDisable`.

The [How to Debug Plugins][how to debug] guide shows how to check when coding activity was last received from Vim use the [User Agents API][user agents api].
For more general troubleshooting info, see the [wakatime-cli Troubleshooting Section][wakatime-cli-help].

## Uninstalling

1. Remove the plugin entry from your plugin manager configuration (e.g., remove or comment out the `wakatime.nvim` entry in your Lazy.nvim setup).

2. Run the appropriate cleanup command for your plugin manager (e.g., `:Lazy clean` for Lazy.nvim).

3. Optionally, remove WakaTime configuration and data.

```bash
rm -rf ~/.wakatime.*
```

[wakatime]: https://wakatime.com/vim
[wakatime-cli]: https://github.com/wakatime/wakatime-cli
[wakatime-cli-config]: https://github.com/wakatime/wakatime-cli/blob/develop/USAGE.md#ini-config-file
[wakatime-cli-help]: https://github.com/wakatime/wakatime#troubleshooting
[how to debug]: https://wakatime.com/faq#debug-plugins
[user agents api]: https://wakatime.com/developers#user_agents
