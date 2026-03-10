-- ==============================================
-- WezTerm 設定ファイル
-- 場所: C:\Users\nakan\.config\wezterm\wezterm.lua
-- ==============================================

-- WezTermの機能を読み込む（おまじないとして必ず書く）
local wezterm = require("wezterm")

-- 設定オブジェクトを作成（おまじないとして必ず書く）
local config = wezterm.config_builder()

-- ==============================================
-- フォント設定
-- ==============================================

-- 使用するフォントを指定
-- Nerd Fontを使うことでNeovimのアイコンが正しく表示される
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- フォントサイズ（お好みで調整）
config.font_size = 13.0

-- ==============================================
-- カラーテーマ
-- ==============================================

-- ターミナル全体の配色テーマ
-- VSCodeのダークテーマに近い見た目になる
-- 他のテーマは https://wezfurlong.org/wezterm/colorschemes/ で確認できる
config.color_scheme = "Kanagawa (Gogh)"

-- ==============================================
-- タブバー設定
-- ==============================================

-- falseにするとシンプルなタブバーになる
-- trueだとブラウザのようなリッチなタブバーになる
config.use_fancy_tab_bar = false

-- タブバーをウィンドウ下部に表示（VSCodeっぽい配置）
config.tab_bar_at_bottom = true

-- ==============================================
-- ウィンドウ設定
-- ==============================================

-- ウィンドウの内側の余白（上下左右のpx）
config.window_padding = {
	left = 8,
	right = 8,
	top = 8,
	bottom = 8,
}

-- 起動時のウィンドウサイズ（列数 x 行数）
-- モニターサイズに合わせて調整する
config.initial_cols = 140
config.initial_rows = 35

-- ==============================================
-- 透明度設定
-- ==============================================

-- ウィンドウの透明度（0.0=完全透明 〜 1.0=不透明）
-- 0.9〜0.95くらいがちょうどいい
-- config.window_background_opacity = 0.5

-- ぼかし効果
-- config.win32_system_backdrop = "Acrylic"

-- 透過ON/OFFをトグルするキーバインド
-- 透過は常に固定
config.window_background_opacity = 0.5
config.win32_system_backdrop = "Acrylic"  -- 初期状態はぼかしON

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

-- タイトルバーを非表示にしてスッキリさせる
-- （ウィンドウの移動はAlt+ドラッグで可能になる）
config.window_decorations = "RESIZE"

-- ==============================================
-- カーソル設定
-- ==============================================

-- カーソルの形状
-- "SteadyBlock"  → 点滅なしブロック（デフォルト）
-- "BlinkingBlock" → 点滅ブロック
-- "SteadyBar"    → 点滅なし縦線（VSCodeのデフォルト）
-- "BlinkingBar"  → 点滅縦線
config.default_cursor_style = "SteadyBar"

-- ==============================================
-- シェル設定
-- ==============================================

-- 起動時に使うシェルを指定
config.default_prog = { "wsl.exe", "--distribution", "Ubuntu", "--cd", "~" }
-- ==============================================
-- スクロール設定
-- ==============================================

-- スクロールバックで遡れる行数
config.scrollback_lines = 10000

-- 自動で設定を反映する
config.automatically_reload_config = true

-- ==============================================
-- 最後に必ずreturnする（おまじないとして必ず書く）
-- ==============================================
return config
