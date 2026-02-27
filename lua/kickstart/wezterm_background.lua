-- Wezterm の wallpaper_path.txt から背景画像パスを取得
-- 使用例: local path = require("kickstart.wezterm_background").get_wallpaper_path()
local M = {}

local function get_wezterm_config_dir()
  local home = os.getenv("HOME") or ""
  if home == "" then
    return nil
  end
  return home .. "/.config/wezterm"
end

--- Wezterm で設定している背景画像のパスを返す（wallpaper_path.txt の1行目）
--- @return string|nil
function M.get_wallpaper_path()
  local config_dir = get_wezterm_config_dir()
  if not config_dir then
    return nil
  end
  local path_file = config_dir .. "/wallpaper_path.txt"
  local f = io.open(path_file, "r")
  if not f then
    return nil
  end
  local line = f:read("*l")
  f:close()
  if line then
    line = line:match("^%s*(.-)%s*$") -- trim
  end
  return (line and line ~= "") and line or nil
end

return M
