-- 自启动
hl.on("hyprland.start", function()
    -- Waybar、Hypridle 和代理由 UWSM/systemd 管理；这里启动输入法
    hl.exec_cmd("fcitx5 -d")

    -- 桌面门户、权限代理、密钥环和会话环境由 UWSM/systemd 管理

    -- 预启动 scratch 终端
    hl.exec_cmd("kitty --class magic-term", { workspace = "special:magic silent" })
end)

-- 光标大小
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
