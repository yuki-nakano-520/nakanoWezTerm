local wezterm = require 'wezterm'
local act = wezterm.action

return {
  keys = {
    -- ===========================
    -- タブ操作
    -- ===========================
    { key = 'Tab', mods = 'CTRL',       action = act.ActivateTabRelative(1) },   -- 次のタブへ
    { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },  -- 前のタブへ

    -- タブ番号で直接移動 (Ctrl+数字)
    { key = '!', mods = 'CTRL',       action = act.ActivateTab(0) },
    { key = '!', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
    { key = '@', mods = 'CTRL',       action = act.ActivateTab(1) },
    { key = '@', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
    { key = '#', mods = 'CTRL',       action = act.ActivateTab(2) },
    { key = '#', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
    { key = '$', mods = 'CTRL',       action = act.ActivateTab(3) },
    { key = '$', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
    { key = '%', mods = 'CTRL',       action = act.ActivateTab(4) },
    { key = '%', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
    { key = '^', mods = 'CTRL',       action = act.ActivateTab(5) },
    { key = '^', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
    { key = '&', mods = 'CTRL',       action = act.ActivateTab(6) },
    { key = '&', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
    { key = '*', mods = 'CTRL',       action = act.ActivateTab(7) },
    { key = '*', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
    { key = '(', mods = 'CTRL',       action = act.ActivateTab(-1) },  -- 最後のタブへ
    { key = '(', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },

    -- Shift+Ctrl+数字でタブ移動
    { key = '1', mods = 'SHIFT|CTRL', action = act.ActivateTab(0) },
    { key = '2', mods = 'SHIFT|CTRL', action = act.ActivateTab(1) },
    { key = '3', mods = 'SHIFT|CTRL', action = act.ActivateTab(2) },
    { key = '4', mods = 'SHIFT|CTRL', action = act.ActivateTab(3) },
    { key = '5', mods = 'SHIFT|CTRL', action = act.ActivateTab(4) },
    { key = '6', mods = 'SHIFT|CTRL', action = act.ActivateTab(5) },
    { key = '7', mods = 'SHIFT|CTRL', action = act.ActivateTab(6) },
    { key = '8', mods = 'SHIFT|CTRL', action = act.ActivateTab(7) },
    { key = '9', mods = 'SHIFT|CTRL', action = act.ActivateTab(-1) },

    -- Super+数字でタブ移動
    { key = '1', mods = 'SUPER', action = act.ActivateTab(0) },
    { key = '2', mods = 'SUPER', action = act.ActivateTab(1) },
    { key = '3', mods = 'SUPER', action = act.ActivateTab(2) },
    { key = '4', mods = 'SUPER', action = act.ActivateTab(3) },
    { key = '5', mods = 'SUPER', action = act.ActivateTab(4) },
    { key = '6', mods = 'SUPER', action = act.ActivateTab(5) },
    { key = '7', mods = 'SUPER', action = act.ActivateTab(6) },
    { key = '8', mods = 'SUPER', action = act.ActivateTab(7) },
    { key = '9', mods = 'SUPER', action = act.ActivateTab(-1) },

    -- Super+括弧でタブ移動
    { key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },  -- 前のタブへ
    { key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },   -- 次のタブへ
    { key = '{', mods = 'SUPER',       action = act.ActivateTabRelative(-1) },
    { key = '{', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
    { key = '}', mods = 'SUPER',       action = act.ActivateTabRelative(1) },
    { key = '}', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },

    -- PageUp/Downでタブ移動・並び替え
    { key = 'PageUp',   mods = 'CTRL',       action = act.ActivateTabRelative(-1) },  -- 前のタブへ
    { key = 'PageUp',   mods = 'SHIFT|CTRL', action = act.MoveTabRelative(-1) },      -- タブを左へ移動
    { key = 'PageDown', mods = 'CTRL',       action = act.ActivateTabRelative(1) },   -- 次のタブへ
    { key = 'PageDown', mods = 'SHIFT|CTRL', action = act.MoveTabRelative(1) },       -- タブを右へ移動

    -- ===========================
    -- ペイン操作（画面分割）
    -- ===========================
    { key = '"', mods = 'ALT|CTRL',       action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },    -- 上下に分割
    { key = '"', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },
    { key = '\'', mods = 'SHIFT|ALT|CTRL', action = act.SplitVertical{ domain = 'CurrentPaneDomain' } },
    { key = '%', mods = 'ALT|CTRL',        action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } }, -- 左右に分割
    { key = '%', mods = 'SHIFT|ALT|CTRL',  action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },
    { key = '5', mods = 'SHIFT|ALT|CTRL',  action = act.SplitHorizontal{ domain = 'CurrentPaneDomain' } },

    -- ペイン間のフォーカス移動 (Shift+Ctrl+矢印)
    { key = 'LeftArrow',  mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Left' },
    { key = 'RightArrow', mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Right' },
    { key = 'UpArrow',    mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Up' },
    { key = 'DownArrow',  mods = 'SHIFT|CTRL', action = act.ActivatePaneDirection 'Down' },

    -- ペインサイズ変更 (Shift+Alt+Ctrl+矢印)
    { key = 'LeftArrow',  mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Left', 1 } },
    { key = 'RightArrow', mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Right', 1 } },
    { key = 'UpArrow',    mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Up', 1 } },
    { key = 'DownArrow',  mods = 'SHIFT|ALT|CTRL', action = act.AdjustPaneSize{ 'Down', 1 } },

    -- ペインをズーム（最大化トグル）
    { key = 'Z', mods = 'CTRL',       action = act.TogglePaneZoomState },
    { key = 'Z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },
    { key = 'z', mods = 'SHIFT|CTRL', action = act.TogglePaneZoomState },

    -- ===========================
    -- ウィンドウ操作
    -- ===========================
    { key = 'Enter', mods = 'ALT',       action = act.ToggleFullScreen },   -- フルスクリーン切替
    { key = 'N',     mods = 'CTRL',      action = act.SpawnWindow },        -- 新しいウィンドウを開く
    { key = 'N',     mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    { key = 'n',     mods = 'SHIFT|CTRL', action = act.SpawnWindow },
    { key = 'n',     mods = 'SUPER',      action = act.SpawnWindow },
    { key = 'M',     mods = 'CTRL',       action = act.Hide },              -- ウィンドウを最小化
    { key = 'M',     mods = 'SHIFT|CTRL', action = act.Hide },
    { key = 'm',     mods = 'SHIFT|CTRL', action = act.Hide },
    { key = 'm',     mods = 'SUPER',      action = act.Hide },

    -- ===========================
    -- タブ開閉
    -- ===========================
    { key = 'T', mods = 'CTRL',       action = act.SpawnTab 'CurrentPaneDomain' },  -- 新規タブを開く
    { key = 'T', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 't', mods = 'SHIFT|CTRL', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 't', mods = 'SUPER',      action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'W', mods = 'CTRL',       action = act.CloseCurrentTab{ confirm = true } },  -- タブを閉じる（確認あり）
    { key = 'W', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
    { key = 'w', mods = 'SHIFT|CTRL', action = act.CloseCurrentTab{ confirm = true } },
    { key = 'w', mods = 'SUPER',      action = act.CloseCurrentTab{ confirm = true } },

    -- ===========================
    -- クリップボード操作
    -- ===========================
    { key = 'C', mods = 'CTRL',       action = act.CopyTo 'Clipboard' },   -- コピー
    { key = 'C', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'c', mods = 'SHIFT|CTRL', action = act.CopyTo 'Clipboard' },
    { key = 'c', mods = 'SUPER',      action = act.CopyTo 'Clipboard' },
    { key = 'V', mods = 'CTRL',       action = act.PasteFrom 'Clipboard' }, -- ペースト
    { key = 'V', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    { key = 'v', mods = 'SHIFT|CTRL', action = act.PasteFrom 'Clipboard' },
    { key = 'v', mods = 'SUPER',      action = act.PasteFrom 'Clipboard' },
    { key = 'Insert', mods = 'SHIFT', action = act.PasteFrom 'PrimarySelection' }, -- プライマリ選択からペースト
    { key = 'Insert', mods = 'CTRL',  action = act.CopyTo 'PrimarySelection' },    -- プライマリ選択へコピー
    { key = 'Copy',   mods = 'NONE',  action = act.CopyTo 'Clipboard' },
    { key = 'Paste',  mods = 'NONE',  action = act.PasteFrom 'Clipboard' },

    -- ===========================
    -- フォントサイズ操作
    -- ===========================
    { key = '+', mods = 'CTRL',       action = act.IncreaseFontSize },  -- フォント拡大
    { key = '+', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
    { key = '=', mods = 'CTRL',       action = act.IncreaseFontSize },
    { key = '=', mods = 'SHIFT|CTRL', action = act.IncreaseFontSize },
    { key = '=', mods = 'SUPER',      action = act.IncreaseFontSize },
    { key = '-', mods = 'CTRL',       action = act.DecreaseFontSize },  -- フォント縮小
    { key = '-', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
    { key = '-', mods = 'SUPER',      action = act.DecreaseFontSize },
    { key = '_', mods = 'CTRL',       action = act.DecreaseFontSize },
    { key = '_', mods = 'SHIFT|CTRL', action = act.DecreaseFontSize },
    { key = ')', mods = 'CTRL',       action = act.ResetFontSize },     -- フォントサイズリセット
    { key = ')', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
    { key = '0', mods = 'CTRL',       action = act.ResetFontSize },
    { key = '0', mods = 'SHIFT|CTRL', action = act.ResetFontSize },
    { key = '0', mods = 'SUPER',      action = act.ResetFontSize },

    -- ===========================
    -- スクロール操作
    -- ===========================
    { key = 'PageUp',   mods = 'SHIFT', action = act.ScrollByPage(-1) },           -- 1ページ上にスクロール
    { key = 'PageDown', mods = 'SHIFT', action = act.ScrollByPage(1) },            -- 1ページ下にスクロール
    { key = 'K',        mods = 'CTRL',       action = act.ClearScrollback 'ScrollbackOnly' }, -- スクロールバックをクリア
    { key = 'K',        mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
    { key = 'k',        mods = 'SHIFT|CTRL', action = act.ClearScrollback 'ScrollbackOnly' },
    { key = 'k',        mods = 'SUPER',      action = act.ClearScrollback 'ScrollbackOnly' },

    -- ===========================
    -- 検索・選択
    -- ===========================
    { key = 'F', mods = 'CTRL',       action = act.Search 'CurrentSelectionOrEmptyString' }, -- 検索
    { key = 'F', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'f', mods = 'SHIFT|CTRL', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'f', mods = 'SUPER',      action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'phys:Space', mods = 'SHIFT|CTRL', action = act.QuickSelect },                   -- クイック選択モード
    { key = 'X', mods = 'CTRL',       action = act.ActivateCopyMode },  -- コピーモードに入る
    { key = 'X', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },
    { key = 'x', mods = 'SHIFT|CTRL', action = act.ActivateCopyMode },

    -- ===========================
    -- その他
    -- ===========================
    { key = 'L', mods = 'CTRL',       action = act.ShowDebugOverlay },   -- デバッグオーバーレイ表示
    { key = 'L', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
    { key = 'l', mods = 'SHIFT|CTRL', action = act.ShowDebugOverlay },
    { key = 'P', mods = 'CTRL',       action = act.ActivateCommandPalette }, -- コマンドパレット
    { key = 'P', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
    { key = 'p', mods = 'SHIFT|CTRL', action = act.ActivateCommandPalette },
    { key = 'R', mods = 'CTRL',       action = act.ReloadConfiguration },    -- 設定ファイルをリロード
    { key = 'R', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = 'r', mods = 'SHIFT|CTRL', action = act.ReloadConfiguration },
    { key = 'r', mods = 'SUPER',      action = act.ReloadConfiguration },
    { key = 'U', mods = 'CTRL',       action = act.CharSelect{ copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } }, -- 文字選択ピッカー
    { key = 'U', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
    { key = 'u', mods = 'SHIFT|CTRL', action = act.CharSelect{ copy_on_select = true, copy_to = 'ClipboardAndPrimarySelection' } },
    { key = 's', mods = 'ALT',        action = act.EmitEvent 'toggle-transparency' }, -- 透明度のトグル（カスタムイベント）
  },

  key_tables = {
    -- ===========================
    -- コピーモード（vim風キーバインド）
    -- ===========================
    copy_mode = {
      -- 移動
      { key = 'h', mods = 'NONE', action = act.CopyMode 'MoveLeft' },             -- 左
      { key = 'j', mods = 'NONE', action = act.CopyMode 'MoveDown' },             -- 下
      { key = 'k', mods = 'NONE', action = act.CopyMode 'MoveUp' },               -- 上
      { key = 'l', mods = 'NONE', action = act.CopyMode 'MoveRight' },            -- 右
      { key = 'LeftArrow',  mods = 'NONE', action = act.CopyMode 'MoveLeft' },
      { key = 'RightArrow', mods = 'NONE', action = act.CopyMode 'MoveRight' },
      { key = 'UpArrow',    mods = 'NONE', action = act.CopyMode 'MoveUp' },
      { key = 'DownArrow',  mods = 'NONE', action = act.CopyMode 'MoveDown' },

      -- 単語単位の移動
      { key = 'w', mods = 'NONE', action = act.CopyMode 'MoveForwardWord' },      -- 次の単語頭へ
      { key = 'e', mods = 'NONE', action = act.CopyMode 'MoveForwardWordEnd' },   -- 次の単語末へ
      { key = 'b', mods = 'NONE', action = act.CopyMode 'MoveBackwardWord' },     -- 前の単語頭へ
      { key = 'b', mods = 'ALT',  action = act.CopyMode 'MoveBackwardWord' },
      { key = 'f', mods = 'ALT',  action = act.CopyMode 'MoveForwardWord' },
      { key = 'LeftArrow',  mods = 'ALT', action = act.CopyMode 'MoveBackwardWord' },
      { key = 'RightArrow', mods = 'ALT', action = act.CopyMode 'MoveForwardWord' },

      -- 行内移動
      { key = '0',  mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLine' },        -- 行頭へ
      { key = '^',  mods = 'NONE',  action = act.CopyMode 'MoveToStartOfLineContent' }, -- 行頭（空白除く）へ
      { key = '^',  mods = 'SHIFT', action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = '$',  mods = 'NONE',  action = act.CopyMode 'MoveToEndOfLineContent' },   -- 行末へ
      { key = '$',  mods = 'SHIFT', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = 'm',  mods = 'ALT',   action = act.CopyMode 'MoveToStartOfLineContent' },
      { key = 'Home', mods = 'NONE', action = act.CopyMode 'MoveToStartOfLine' },
      { key = 'End',  mods = 'NONE', action = act.CopyMode 'MoveToEndOfLineContent' },
      { key = 'Enter', mods = 'NONE', action = act.CopyMode 'MoveToStartOfNextLine' },  -- 次の行頭へ

      -- 画面・スクロールバック内移動
      { key = 'g', mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackTop' },    -- スクロールバック先頭へ
      { key = 'G', mods = 'NONE',  action = act.CopyMode 'MoveToScrollbackBottom' }, -- スクロールバック末尾へ
      { key = 'G', mods = 'SHIFT', action = act.CopyMode 'MoveToScrollbackBottom' },
      { key = 'H', mods = 'NONE',  action = act.CopyMode 'MoveToViewportTop' },      -- 表示領域の先頭へ
      { key = 'H', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportTop' },
      { key = 'M', mods = 'NONE',  action = act.CopyMode 'MoveToViewportMiddle' },   -- 表示領域の中央へ
      { key = 'M', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportMiddle' },
      { key = 'L', mods = 'NONE',  action = act.CopyMode 'MoveToViewportBottom' },   -- 表示領域の末尾へ
      { key = 'L', mods = 'SHIFT', action = act.CopyMode 'MoveToViewportBottom' },

      -- ページ移動
      { key = 'b',        mods = 'CTRL', action = act.CopyMode 'PageUp' },            -- 1ページ上
      { key = 'f',        mods = 'CTRL', action = act.CopyMode 'PageDown' },          -- 1ページ下
      { key = 'u',        mods = 'CTRL', action = act.CopyMode{ MoveByPage = (-0.5) } }, -- 半ページ上
      { key = 'd',        mods = 'CTRL', action = act.CopyMode{ MoveByPage = (0.5) } },  -- 半ページ下
      { key = 'PageUp',   mods = 'NONE', action = act.CopyMode 'PageUp' },
      { key = 'PageDown', mods = 'NONE', action = act.CopyMode 'PageDown' },

      -- ジャンプ（行内文字検索）
      { key = 'f', mods = 'NONE',  action = act.CopyMode{ JumpForward  = { prev_char = false } } }, -- 次の文字へジャンプ
      { key = 'F', mods = 'NONE',  action = act.CopyMode{ JumpBackward = { prev_char = false } } }, -- 前の文字へジャンプ
      { key = 'F', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = false } } },
      { key = 't', mods = 'NONE',  action = act.CopyMode{ JumpForward  = { prev_char = true } } },  -- 次の文字の手前へ
      { key = 'T', mods = 'NONE',  action = act.CopyMode{ JumpBackward = { prev_char = true } } },  -- 前の文字の手前へ
      { key = 'T', mods = 'SHIFT', action = act.CopyMode{ JumpBackward = { prev_char = true } } },
      { key = ';', mods = 'NONE',  action = act.CopyMode 'JumpAgain' },    -- 同方向に再ジャンプ
      { key = ',', mods = 'NONE',  action = act.CopyMode 'JumpReverse' },  -- 逆方向に再ジャンプ

      -- 選択モード
      { key = 'Space', mods = 'NONE', action = act.CopyMode{ SetSelectionMode = 'Cell' } },   -- 文字選択モード
      { key = 'v',     mods = 'NONE', action = act.CopyMode{ SetSelectionMode = 'Cell' } },
      { key = 'V',     mods = 'NONE', action = act.CopyMode{ SetSelectionMode = 'Line' } },   -- 行選択モード
      { key = 'V',     mods = 'SHIFT', action = act.CopyMode{ SetSelectionMode = 'Line' } },
      { key = 'v',     mods = 'CTRL', action = act.CopyMode{ SetSelectionMode = 'Block' } },  -- ブロック選択モード

      -- 選択範囲の端を切替
      { key = 'o', mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEnd' },      -- 選択範囲の反対端へ
      { key = 'O', mods = 'NONE',  action = act.CopyMode 'MoveToSelectionOtherEndHoriz' }, -- 水平方向の反対端へ
      { key = 'O', mods = 'SHIFT', action = act.CopyMode 'MoveToSelectionOtherEndHoriz' },

      -- タブ移動
      { key = 'Tab',       mods = 'NONE',  action = act.CopyMode 'MoveForwardWord' },   -- 次の単語へ
      { key = 'Tab',       mods = 'SHIFT', action = act.CopyMode 'MoveBackwardWord' },  -- 前の単語へ

      -- コピーして閉じる
      { key = 'y', mods = 'NONE', action = act.Multiple{
          { CopyTo = 'ClipboardAndPrimarySelection' },
          { CopyMode = 'Close' }
        }
      }, -- ヤンク（コピー）してコピーモードを閉じる

      -- コピーモードを閉じる
      { key = 'Escape', mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'q',      mods = 'NONE', action = act.CopyMode 'Close' },
      { key = 'c',      mods = 'CTRL', action = act.CopyMode 'Close' },
      { key = 'g',      mods = 'CTRL', action = act.CopyMode 'Close' },
    },

    -- ===========================
    -- 検索モード
    -- ===========================
    search_mode = {
      { key = 'Enter',     mods = 'NONE', action = act.CopyMode 'PriorMatch' },      -- 前のマッチへ
      { key = 'Escape',    mods = 'NONE', action = act.CopyMode 'Close' },           -- 検索モードを閉じる
      { key = 'n',         mods = 'CTRL', action = act.CopyMode 'NextMatch' },       -- 次のマッチへ
      { key = 'p',         mods = 'CTRL', action = act.CopyMode 'PriorMatch' },      -- 前のマッチへ
      { key = 'r',         mods = 'CTRL', action = act.CopyMode 'CycleMatchType' },  -- マッチタイプを切替（正規表現/文字列）
      { key = 'u',         mods = 'CTRL', action = act.CopyMode 'ClearPattern' },    -- 検索パターンをクリア
      { key = 'PageUp',    mods = 'NONE', action = act.CopyMode 'PriorMatchPage' },  -- 前のページのマッチへ
      { key = 'PageDown',  mods = 'NONE', action = act.CopyMode 'NextMatchPage' },   -- 次のページのマッチへ
      { key = 'UpArrow',   mods = 'NONE', action = act.CopyMode 'PriorMatch' },
      { key = 'DownArrow', mods = 'NONE', action = act.CopyMode 'NextMatch' },
    },
  }
}