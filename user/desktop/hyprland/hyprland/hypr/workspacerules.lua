-- =====================================================
-- Workspacerules
-- =====================================================

-- big outer gaps for special workspaces
hl.workspace_rule({ workspace = "s[true]", gaps_out = 128, animation = "specialWorkspace" })

-- no border, rounding and gaps when maximized
-- "f[1]s[false], border:false, rounding:false, gapsout:0"
hl.workspace_rule({ workspace = "f[1]s[false]", no_border = true, no_rounding = true, gaps_out = 0 })

-- special workspaces 
hl.workspace_rule({ workspace = "special:terminal", on_created_empty = "[float]  kitty" })
hl.workspace_rule({ workspace = "special:music", on_created_empty = "[float] spotify" })
hl.workspace_rule({ workspace = "special:files", on_created_empty = "[float] thunar" })
