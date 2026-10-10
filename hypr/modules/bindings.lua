local mainMod = "SUPER" -- 主修饰键
local terminal = "kitty"
local fileManager = "nautilus"
local menu = "hyprlauncher"

-- 窗口管理
hl.bind(mainMod .. " + SHIFT + return", hl.dsp.exec_cmd(terminal)) -- 打开终端
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.window.close()) -- 关闭活动窗口
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit()) -- 退出 Hyprland
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("microsoft-edge --ozone-platform=wayland --enable-wayland-ime --password-store=gnome-libsecret")) -- 打开 Edge
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(fileManager)) -- 打开文件管理器
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })) -- 切换全屏
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" })) -- 切换浮动状态
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(menu)) -- 打开应用启动器
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock")) -- 锁屏

-- 电源键
hl.bind("XF86PowerOff", hl.dsp.exec_cmd("loginctl lock-session")) -- 锁定当前会话

-- 通知中心
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("swaync-client --close-latest"), { description = "关闭最新通知" })
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd("swaync-client --close-all"), { description = "关闭所有通知" })
hl.bind(mainMod .. " + CTRL + COMMA", hl.dsp.exec_cmd("swaync-client --toggle-panel"), { description = "打开通知中心" })
hl.bind(mainMod .. " + ALT + COMMA", hl.dsp.exec_cmd("swaync-client --toggle-dnd && swaync-client --get-dnd | grep -q 'true' && notify-send '已开启免打扰' || notify-send '已关闭免打扰'"), { description = "切换免打扰" })

-- 截图
local hyprshot = os.getenv("HOME") .. "/.local/bin/hyprshot"

hl.bind("PRINT", hl.dsp.exec_cmd(hyprshot .. " -m region"), { description = "区域截图" }) -- 选择区域
hl.bind("ALT + PRINT", hl.dsp.exec_cmd(hyprshot .. " -m window"), { description = "窗口截图" }) -- 当前窗口
hl.bind("SHIFT + PRINT", hl.dsp.exec_cmd(hyprshot .. " -m output"), { description = "显示器截图" }) -- 当前显示器

-- 音量调节
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true, repeating = true, description = "增大音量" }) -- 支持长按
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { locked = true, repeating = true, description = "减小音量" }) -- 支持长按
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true, description = "静音" }) -- 切换静音
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("swayosd-client --input-volume mute-toggle"), { locked = true, description = "麦克风静音" }) -- 切换麦克风静音

-- 屏幕亮度调节
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { locked = true, repeating = true, description = "提高亮度" }) -- 支持长按
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { locked = true, repeating = true, description = "降低亮度" }) -- 支持长按

local magicStack = os.getenv("HOME") .. "/.local/bin/magic-stack"

-- 窗口聚焦与 Scratch 联动
hl.bind(mainMod .. " + J", hl.dsp.exec_cmd(magicStack .. " next-key"), { description = "聚焦下一个窗口" }) -- Scratch 可见时切换堆叠，否则切换 Master 窗口
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd(magicStack .. " prev-key"), { description = "聚焦上一个窗口" }) -- Scratch 可见时反向切换，否则反向切换 Master 窗口
hl.bind(mainMod .. " + C", hl.dsp.layout("focusmaster"), { description = "聚焦 Master" }) -- 在 Master 与子窗口间切换

-- Master 布局操作
hl.bind(mainMod .. " + return", hl.dsp.layout("swapwithmaster"), { description = "与 Master 交换" }) -- 交换当前窗口与 Master 窗口
hl.bind(mainMod .. " + I", hl.dsp.layout("addmaster"), { description = "增加 Master" }) -- 将窗口加入 Master 区域
hl.bind(mainMod .. " + D", hl.dsp.layout("removemaster"), { description = "减少 Master" }) -- 将窗口移出 Master 区域

-- 工作区切换行为
hl.config({
    binds = {
        allow_workspace_cycles = true, -- 保留工作区切换历史，允许连续向前回溯
    },
})

hl.bind("ALT + TAB", hl.dsp.focus({ workspace = "previous" }), { description = "返回上一个工作区" }) -- 按历史顺序切换

-- 窗口大小调整
hl.bind(mainMod .. " + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { description = "增加窗口宽度" }) -- 水平方向增加 10 像素
hl.bind(mainMod .. " + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { description = "减小窗口宽度" }) -- 水平方向减少 10 像素

-- 数字工作区快捷键
for i = 1, 10 do
    local key = i % 10 -- 工作区 10 对应数字键 0

    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), {
        description = "切换到工作区 " .. i,
    }) -- 切换工作区

    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }), {
        description = "移动窗口到工作区 " .. i,
    }) -- 移动窗口并跟随到目标工作区
end

-- Scratchpad 终端堆叠
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(magicStack .. " toggle"), { description = "显示或隐藏 Scratchpad" }) -- 空工作区会自动创建终端
hl.bind(mainMod .. " + CTRL + S", hl.dsp.exec_cmd(magicStack .. " spawn"), { description = "新建 Scratchpad 终端" }) -- 新终端加入堆叠
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }), { description = "移入 Scratchpad" }) -- 移动当前窗口并进入 Scratchpad

-- 鼠标操作
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }), { description = "下一个工作区" }) -- Super 加向下滚轮
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }), { description = "上一个工作区" }) -- Super 加向上滚轮
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true, description = "拖动窗口" }) -- Super 加鼠标左键
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true, description = "缩放窗口" }) -- Super 加鼠标右键
