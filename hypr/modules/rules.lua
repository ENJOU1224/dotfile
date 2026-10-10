-- 通用浮动窗口规则
hl.window_rule({
    name = "float-portal-dialogs",
    match = { class = "^xdg-desktop-portal-gtk$" },
    float = true,
}) -- GTK 文件选择等门户窗口

hl.window_rule({
    name = "float-nautilus-dialogs",
    match = {
        class = "^org[.]gnome[.]Nautilus$", -- Nautilus 当前应用 ID
        modal = true,                       -- 属性、确认等模态窗口
    },
    float = true,
})

hl.window_rule({
    name = "float-network-editor",
    match = { class = "^nm-connection-editor$" },
    float = true,
}) -- 高级网络配置

hl.window_rule({
    name = "float-polkit-agent",
    match = { class = "^(hyprpolkitagent|Hyprland Polkit Agent)$" },
    float = true,
}) -- Hyprland 权限认证窗口

hl.window_rule({
    name = "float-waybar-tools",
    match = { class = "^(wiremix|wlctl|bluetui)$" },
    float = true,
    size = { "monitor_w * 0.9", "monitor_h * 0.9" },
    center = true,
}) -- Waybar 打开的音频、网络和蓝牙终端工具

-- Scratchpad 窗口规则
hl.window_rule({
    name = "scratch-by-class",
    match = { class = "^magic-term$" },
    float = true,                                       -- 浮动显示
    size = { "monitor_w * 0.85", "monitor_h * 0.75" }, -- 显示器宽度 85%、高度 75%
    center = true,                                      -- 初始居中
}) -- 确保预启动的 magic-term 正确应用规则

hl.window_rule({
    name = "scratch-by-workspace",
    match = { workspace = "special:magic" },
    float = true,                                       -- Scratchpad 中的窗口统一浮动
    size = { "monitor_w * 0.85", "monitor_h * 0.75" }, -- 显示器宽度 85%、高度 75%
    center = true,                                      -- 初始居中
}) -- 确保后来移入 Scratchpad 的普通窗口也应用规则
