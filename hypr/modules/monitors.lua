-- 主显示器配置：10bit 色深，可变刷新率
hl.monitor({
    output = "eDP-1",
    mode = "preferred",
    position = "auto",
    scale = "auto",
    bitdepth = 10,
    vrr = 3,
})
