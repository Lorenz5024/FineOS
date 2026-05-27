-- =====================================================
-- Animations
-- =====================================================

hl.curve("overshot", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.03} } } )

hl.animation({ 
  leaf = "global",
  enabled = true,
  speed = 4,
  bezier = "default",
})

hl.animation({ 
  leaf = "windows",
  enabled = true,
  speed = 4,
  bezier = "overshot",
  style = "slide",
})

hl.animation({ 
  leaf = "windowsMove",
  enabled = true,
  speed = 4,
  bezier = "default",
})

hl.animation({ 
  leaf = "specialWorkspace",
  enabled = true,
  speed = 8,
  bezier = "default",
  style = "fade",
})
