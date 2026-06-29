-- =============================================================================
-- monitors.lua — Display output configuration
-- =============================================================================

hl.monitor({
  output   = "HDMI-A-1",     -- Explicitly match the name from hyprctl (Change to "DP-1" if you switch to DisplayPort)
  mode     = "3840x2160@60", -- 4K @ 60Hz: highest refresh this panel advertises at 4K (EDID has no 240Hz mode; 2560x1440@120 is available if you prefer refresh over resolution)
  position = "0x0",          -- Primary display positioning
  scale    = "1.5",          -- 1.5 (150%) scaling for comfortable UI readability
  bitdepth = 10,             -- 10-bit color for QD-OLED - reduces gradient banding
})
