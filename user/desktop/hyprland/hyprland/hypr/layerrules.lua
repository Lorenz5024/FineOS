-- =====================================================
-- Layer Rules
-- =====================================================

hl.layer_rule({
  match = { namespace = "logout_dialog" },
  blur = true,
})

hl.layer_rule({
  match = { namespace = "rofi" },
  animation = "slide",
  blur = true,
})
