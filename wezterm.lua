local wezterm = require 'wezterm'

local config = wezterm.config_builder()

-- GENERAL CONFIG
config.audible_bell = "Disabled"
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.default_cursor_style = "SteadyBar"
config.font_size = 13.0
config.adjust_window_size_when_changing_font_size = false
config.line_height = 1.25

-- APPLY DIFFERENT KEYBINDS BASED ON SYSTEM
local is_macos = wezterm.target_triple == "x86_64-apple-darwin" or wezterm.target_triple == "aarch64-apple-darwin"
local is_linux = wezterm.target_triple == "x86_64-unknown-linux-gnu" or wezterm.target_triple == "aarch64-unknown-linux-gnu"

if is_macos then
    config.keys = {
        -- ADD NEW SHORTCUTS
        {
            key = 'a',
            mods = 'CMD',
            action = wezterm.action.ShowTabNavigator
        },
        {
            key = '|',
            mods = 'CMD|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
        },
        {
            key = '}',
            mods = 'CMD|SHIFT',
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
        },
        {
            key = 'w',
            mods = 'CMD',
            action = wezterm.action.CloseCurrentPane { confirm = false }
        },

        -- ADD PANE NAVIGATION
        {
            key = 'LeftArrow',
            mods = 'OPT',
            action = wezterm.action.ActivatePaneDirection 'Left'
        },
        {
            key = 'RightArrow',
            mods = 'OPT',
            action = wezterm.action.ActivatePaneDirection 'Right'
        },
        {
            key = 'UpArrow',
            mods = 'OPT',
            action = wezterm.action.ActivatePaneDirection 'Up'
        },
        {
            key = 'DownArrow',
            mods = 'OPT',
            action = wezterm.action.ActivatePaneDirection 'Down'
        }
    }
elseif is_linux then
    config.keys = {
        -- ADD NEW SHORTCUTS
        {
            key = 'a',
            mods = 'CTRL',
            action = wezterm.action.ShowTabNavigator
        },
        {
            key = '|',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" }
        },
        {
            key = '}',
            mods = 'CTRL|SHIFT',
            action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" }
        },
        {
            key = 'w',
            mods = 'CTRL',
            action = wezterm.action.CloseCurrentPane { confirm = false }
        },

        -- ADJUST DEFAULT CTRL|SHIFT TO CTRL
        {
            key = 'c',
            mods = 'CTRL',
            action = wezterm.action.CopyTo "Clipboard"
        },
        {
            key = 'v',
            mods = 'CTRL',
            action = wezterm.action.PasteFrom "Clipboard"
        },
        {
            key = 't',
            mods = 'CTRL',
            action = wezterm.action.SpawnTab "DefaultDomain"
        },

        -- ADJUST DEFAULT TERMINAL ACTIONS
        {
            key = 'c',
            mods = 'ALT',
            action = wezterm.action.SendKey { key = 'c', mods = 'CTRL' }
        },
        {
            key = 'l',
            mods = 'ALT',
            action = wezterm.action.SendKey { key = 'l', mods = 'CTRL' }
        },
        {
            key = 'u',
            mods = 'ALT',
            action = wezterm.action.SendKey { key = 'u', mods = 'CTRL' }
        },
        {
            key = 'r',
            mods = 'ALT',
            action = wezterm.action.SendKey { key = 'r', mods = 'CTRL' }
        },
        {
            key = 'c',
            mods = 'CTRL',
            action = "Nop"
        },
        {
            key = 'l',
            mods = 'CTRL',
            action = "Nop"
        },
        {
            key = 'u',
            mods = 'CTRL',
            action = "Nop"
        },
        {
            key = 'r',
            mods = 'CTRL',
            action = "Nop"
        },

        -- ADD PANE NAVIGATION
        {
            key = 'LeftArrow',
            mods = 'SUPER',
            action = wezterm.action.ActivatePaneDirection 'Left'
        },
        {
            key = 'RightArrow',
            mods = 'SUPER',
            action = wezterm.action.ActivatePaneDirection 'Right'
        },
        {
            key = 'UpArrow',
            mods = 'SUPER',
            action = wezterm.action.ActivatePaneDirection 'Up'
        },
        {
            key = 'DownArrow',
            mods = 'SUPER',
            action = wezterm.action.ActivatePaneDirection 'Down'
        }
    }

    -- ADJUST DEFAULT CTRL|SHIFT TO CTRL
    for i = 1, 9 do
        table.insert(config.keys, {
            key = tostring(i),
            mods = 'CTRL',
            action = wezterm.action.ActivatePaneByIndex(i - 1)
        })
    end

end

return config
