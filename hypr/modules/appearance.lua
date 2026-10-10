-- 窗口和布局通用设置
hl.config({
    general = {
        gaps_in = 2,          -- 窗口间间隙
        gaps_out = 5,         -- 屏幕边缘间隙
        gaps_workspaces = 10, -- 工作区间隙
        border_size = 2,      -- 边框粗细

        col = {
            active_border = { -- 活跃窗口渐变边框
                colors = {
                    "rgba(a0ffffae)", -- 青绿色
                    "rgba(ffffa0ae)", -- 淡黄色
                },
            },
            inactive_border = "rgba(595959aa)", -- 非活跃窗口灰色边框
        },

        layout = "master", -- 使用 Master 布局
    },
})

-- 窗口装饰效果
hl.config({
    decoration = {
        rounding = 8,              -- 圆角半径
        inactive_opacity = 0.9575, -- 非活跃窗口轻微透明
        dim_inactive = true,       -- 非活跃窗口变暗
        dim_strength = 0.2,        -- 变暗强度

        shadow = {
            enabled = false, -- 禁用窗口阴影
        },

        blur = {
            enabled = false, -- 禁用背景模糊
        },
    },
})

-- 自定义动画曲线
hl.curve("myBezier", {
    type = "bezier",                            -- 三次贝塞尔曲线
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } }, -- 两个控制点
})

-- 动画配置
hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 7,
    bezier = "myBezier",
}) -- 窗口出现

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
}) -- 窗口消失

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 10,
    bezier = "default",
}) -- 边框变化

hl.animation({
    leaf = "borderangle",
    enabled = true,
    speed = 8,
    bezier = "default",
}) -- 边框角度

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 7,
    bezier = "default",
}) -- 淡入淡出

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 6,
    bezier = "myBezier",
    style = "slidefade 20%",
}) -- 工作区切换

hl.animation({
    leaf = "specialWorkspace",
    enabled = true,
    speed = 10,
    bezier = "myBezier",
    style = "slidefadevert -50%",
}) -- Special workspace 从上方滑入

-- 杂项设置
hl.config({
    misc = {
        disable_hyprland_logo = true,    -- 禁用 Hyprland 内置背景
        disable_splash_rendering = true, -- 禁用屏幕底部的随机标语
    },
})
