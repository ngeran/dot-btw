-- =============================================================================
-- monitors.lua — Display output configuration
-- =============================================================================

hl.monitor({
  output   = "HDMI-A-1",      -- Explicitly match the name from hyprctl (Change to "DP-1" if you switch to DisplayPort)
  mode     = "3840x2160@240", -- Native 4K resolution at 240Hz refresh rate
  position = "0x0",           -- Primary display positioning
  scale    = "1.5",           -- 1.5 (150%) scaling for comfortable UI readability
})
