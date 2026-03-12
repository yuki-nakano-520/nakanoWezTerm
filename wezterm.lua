-- ==============================================
-- wezterm 設定ファイル
-- 場所: C:\Users\nakan\.config\wezterm\wezterm.lua
-- ==============================================

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ==============================================
-- フォント設定
-- ==============================================
config.font = wezterm.font_with_fallback({
  "Cascadia Code",   -- 英数字・記号メイン
  "Yu Gothic",       -- 日本語フォールバック
})
config.font_size = 13.0

-- ==============================================
-- カラーテーマ
-- ==============================================
config.color_scheme = "Kanagawa (Gogh)"

-- ==============================================
-- タブバー設定
-- ==============================================
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false

-- 矢印型タブをformat-tab-titleイベントで実現
-- tab_bar_styleはバージョンによって非対応のためこちらを使う
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local title = tab.active_pane.title
  if tab.is_active then
    return {
      { Background = { Color = "#1f1f28" } },
      { Foreground = { Color = "#7e9cd8" } },
      { Text = SOLID_LEFT_ARROW },
      { Background = { Color = "#7e9cd8" } },
      { Foreground = { Color = "#1f1f28" } },
      { Text = " " .. title .. " " },
      { Background = { Color = "#1f1f28" } },
      { Foreground = { Color = "#7e9cd8" } },
      { Text = SOLID_RIGHT_ARROW },
    }
  end
  return {
    { Background = { Color = "#1f1f28" } },
    { Foreground = { Color = "#2a2a37" } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = "#2a2a37" } },
    { Foreground = { Color = "#727169" } },
    { Text = " " .. title .. " " },
    { Background = { Color = "#1f1f28" } },
    { Foreground = { Color = "#2a2a37" } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

config.colors = {
  tab_bar = {
    background = "#1f1f28",
    new_tab = {
      bg_color = "#1f1f28",
      fg_color = "#727169",
    },
  },
}

-- ==============================================
-- ウィンドウ設定
-- ==============================================
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}
config.initial_cols = 140
config.initial_rows = 35

-- ==============================================
-- 透明度設定
-- ==============================================
config.window_background_opacity = 0.8
config.win32_system_backdrop = "Acrylic"

local is_blur = true

wezterm.on("toggle-transparency", function(window)
  is_blur = not is_blur
  window:set_config_overrides({
    win32_system_backdrop = is_blur and "Acrylic" or "Disable",
  })
end)

config.keys = {
  {
    key = "s",
    mods = "ALT",
    action = wezterm.action.EmitEvent("toggle-transparency"),
  },
}

-- ==============================================
-- タイトルバー設定
-- ==============================================
config.window_decorations = "RESIZE"

-- ==============================================
-- カーソル設定
-- ==============================================
config.default_cursor_style = "SteadyBar"

-- ==============================================
-- シェル設定
-- ==============================================
wezterm.on("gui-startup", function()
  local tab, pane, window = wezterm.mux.spawn_window({
    args = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" },
  })
  tab:set_title("WSL")

  window:spawn_tab({
    args = { "powershell.exe" },
  })

  tab:activate()
end)

-- ==============================================
-- スクロール設定
-- ==============================================
config.scrollback_lines = 10000
config.automatically_reload_config = true

return config
