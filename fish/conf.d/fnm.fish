# 1. 将 fnm 的安装目录加入 PATH 环境变量 (兼容两种可能的安装路径)
if test -d "$HOME/.fnm"
    fish_add_path "$HOME/.fnm"
else if test -d "$HOME/.local/share/fnm"
    fish_add_path "$HOME/.local/share/fnm"
end

# 2. 配置国内镜像源加速 Node 下载
set -gx FNM_NODE_DIST_MIRROR "https://npmmirror.com/mirrors/node/"

# 3. 激活 fnm 环境
if type -q fnm
    fnm env --use-on-cd --shell fish | source
end
