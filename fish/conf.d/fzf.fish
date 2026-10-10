# fzf 配置

# 基础设置
set -gx FZF_DEFAULT_COMMAND 'fdfind -tf --hidden --follow --exclude .git'
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_ALT_C_COMMAND 'fdfind -td --hidden --follow --exclude .git'

# 外观和预览（vim 键位）
set -gx FZF_DEFAULT_OPTS '--height 60% --layout=reverse --border --preview "batcat --style=numbers --color=always {}" --preview-window=right:50% --bind=ctrl-j:down,ctrl-k:up,ctrl-h:preview-page-up,ctrl-l:preview-page-down'
set -gx FZF_CTRL_T_OPTS '--preview "batcat --style=numbers --color=always {}" --preview-window=right:50%'

# 模糊补全选项
set -gx FZF_COMPLETION_OPTS '--height 40% --layout=reverse --border'
