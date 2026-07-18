-- =====================================================
-- Workspacerules
-- =====================================================

-- animation for special workspaces
hl.workspace_rule({ workspace = "s[true]", animation = "specialWorkspace" })

-- no border, rounding and gaps when maximized
hl.workspace_rule({ workspace = "f[1]s[false]", no_border = true, no_rounding = true, gaps_out = 0 })

-- special workspaces 
hl.workspace_rule({ workspace = "special:terminal", on_created_empty = "[float]  kitty" })
hl.workspace_rule({ workspace = "special:music", on_created_empty = "[float] spotify" })
hl.workspace_rule({ workspace = "special:files", on_created_empty = "[float] thunar" })
hl.workspace_rule({ workspace = "special:yazi", on_created_empty = "[float] yazi" })

hl.workspace_rule({ 
  workspace = "special:zathura", 
  layout = "scrolling",
})
