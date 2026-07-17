hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NVD_BACKEND", "direct")

hl.monitor({
  output = "DP-1",
  mode = "3440x1440@144",
  position = "0x0",
  scale = 1,
  vrr = 3,
  reserved_area = {
    right = 440,
    left = 440,
  }
})

hl.monitor({
  output = "HDMI-A-1",
  disabled = true,
})

-- set reserved area
hl.bind("SUPER + ALT + DOWN", hl.dsp.exec_cmd([[
  hyprctl eval 'hl.monitor({
    output = "DP-1",
    mode = "3440x1440@144",
    position = "0x0",
    scale = 1,
    vrr = 3,
    reserved_area = {
      right = 440,
      left = 440,
    }
  })'
]]))

-- remove reserved area
hl.bind("SUPER + ALT + UP", hl.dsp.exec_cmd([[
  hyprctl eval 'hl.monitor({
    output = "DP-1",
    mode = "3440x1440@144",
    position = "0x0",
    scale = 1,
    vrr = 3,
    reserved_area = {
      right = 0,
      left = 0,
    }
  })'
]]))

-- set hdr on
hl.bind("SUPER + ALT + CTRL + SHIFT + F2", hl.dsp.exec_cmd([[
  hyprctl eval 'hl.monitor({
    output = "DP-1",
    mode = "3440x1440@144",
    position = "0x0",
    scale = 1,
    vrr = 3,
    bitdepth = 10,
    cm = "hdr",
    sdrbrightness = 1.2,
    sdrsaturation = 0.98,
    sdr_min_luminance = 0,
  })'
]]))

-- set hdr off
hl.bind("SUPER + ALT + CTRL + SHIFT + F1", hl.dsp.exec_cmd([[
  hyprctl eval 'hl.monitor({
    output = "DP-1",
    mode = "3440x1440@144",
    position = "0x0",
    scale = 1,
    vrr = 3,
    cm = "srgb",
  })'
]]))
