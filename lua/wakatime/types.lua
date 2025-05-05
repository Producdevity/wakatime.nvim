--- @meta

local wakatime = {}

--- @class wakatime.Config
--- @field heartbeat_frequency? number # Frequency in minutes to send heartbeats for the same file. Defaults to 2.
--- @field cli_path? string # Absolute path to wakatime-cli. Overrides auto-detection. Defaults to nil.
--- @field python_binary? string # Path to Python executable for CLI installation. Overrides auto-detection. Defaults to nil.
--- @field debug? boolean # Enable verbose logging. Defaults to false.
--- @field hidefilenames? boolean # (Currently unused) Option for hiding filenames. Defaults to false.
--- @field ignore? string[] # List of Lua patterns for files/paths to ignore. Defaults to git message patterns.
--- @field redraw_setting? "'auto'" | "'enabled'" | "'disabled'" # Screen redraw behavior after sending heartbeats. Defaults to 'auto'.
--- @field api_key_vault_cmd? string # Shell command to retrieve the API key. Defaults to nil.
--- @field plugin_name? string # Plugin name used in User Agent. Defaults to 'neovim-wakatime'.

wakatime.Config = {}

return wakatime
