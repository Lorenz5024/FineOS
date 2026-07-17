-- =====================================================
-- Window Rules
-- =====================================================

-- set tags
hl.window_rule({ match = { class = "com.discordapp.Discord" }, tag = "+chat" })
hl.window_rule({ match = { class = "Spotify" }, tag = "+music" })
hl.window_rule({ match = { class = "steam" }, tag = "+gamelauncher" })
hl.window_rule({ match = { class = "heroic" }, tag = "+gamelauncher" })
hl.window_rule({ match = { class = "steam_app_\\d+$" }, tag = "+game" })
hl.window_rule({ match = { class = "org.gnome.World.Iota" }, tag = "+utility" })
hl.window_rule({ match = { class = "org.speedcrunch." }, tag = "+utility" })
hl.window_rule({ match = { class = "com.nextcloud.desktopclient.nextcloud" }, tag = "+utility" })
hl.window_rule({ match = { class = "org.pulseaudio.pavucontrol" }, tag = "+utility" })
hl.window_rule({ match = { class = "vivaldi-stable" }, tag = "+browser" })
hl.window_rule({ match = { class = "kitty" }, tag = "+terminal" })

-- fixed workspaces
hl.window_rule({ name = "workspace-browser", 		match = { tag = "browser" }, workspace = "2", })
hl.window_rule({ name = "workspace-chat", 		match = { tag = "chat" }, workspace = "4 silent", })
hl.window_rule({ name = "workspace-gamelauncher", 	match = { tag = "gamelauncher" }, workspace = "5", })
hl.window_rule({ name = "workspace-game", 		match = { tag = "game" }, workspace = "6", })

-- float
hl.window_rule({ name = "float-utility", match = { tag = "utility" }, float = true, })

-- transparency
hl.window_rule({ name = "transparent-terminal", match = { tag = "terminal" }, opacity = "1 0.95", })

-- group
hl.window_rule({ name = "group-zathura", match = { class = "org.pwmt.zathura" }, group = "set always lock always invade" })


