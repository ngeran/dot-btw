-- =============================================================================
-- rules.lua — Window and layer rules
-- =============================================================================

-- ── Global suppressions ───────────────────────────────────────────────────────
hl.window_rule({
  name           = "suppress-maximize-events",
  match          = { class = ".*" },
  suppress_event = "maximize",
})

-- Fix XWayland drag-and-drop ghost windows
hl.window_rule({
  name     = "fix-xwayland-drags",
  match    = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false
  },
  no_focus = true,
})

-- hyprland-run floating placement
hl.window_rule({
  name  = "move-hyprland-run",
  match = { class = "hyprland-run" },
  move  = "20 monitor_h-120",
  float = true,
})

-- ── QuickShell surfaces ───────────────────────────────────────────────────────
hl.window_rule({
  name        = "quickshell-wayland",
  match       = { class = "quickshell" },
  float       = true,
  rounding    = 0,
  border_size = 0,
})

-- ── Floating TUI overlays ─────────────────────────────────────────────────────
-- Shared geometry: 900×650, centred, pinned, zero rounding (OLED longevity)
local tui_defaults = {
  float = true,
  pin = true,
  size = "900 650",
  center = true,
  rounding = 0,
  border_size = 1
}

local tui_apps = { "impala-float", "bluetui-float", "wiremix-float", "fastfetch-float" }

for _, cls in ipairs(tui_apps) do
  local rule = { name = cls .. "-rule", match = { class = "^" .. cls .. "$" } }
  for k, v in pairs(tui_defaults) do rule[k] = v end
  hl.window_rule(rule)
end
