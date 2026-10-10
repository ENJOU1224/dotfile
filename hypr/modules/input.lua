-- 触摸板设置
hl.config({
    input = {
        touchpad = {
            natural_scroll = true, -- 启用自然滚动
        },
    },
})

-- 三指水平滑动切换工作区
hl.gesture({
    fingers = 3,               -- 使用三根手指
    direction = "horizontal", -- 水平方向滑动
    action = "workspace",     -- 切换工作区
})
