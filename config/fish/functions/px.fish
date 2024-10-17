function px
    #!/usr/bin/env fish

    # 获取所有显示器
    set monitors (xrandr --listmonitors | awk 'NR>1 {print $4}')

    # 使用 fzf 选择显示器
    set selected_monitor (echo $monitors | fzf --prompt="Select a monitor: ")

    # 如果没有选择任何显示器，退出脚本
    if test -z "$selected_monitor"
        echo "No monitor selected."
        exit 1
    end

    # 获取所选显示器支持的所有分辨率，每行一个
    set resolutions (xrandr | grep -A 10 "^$selected_monitor" | grep -oP '\d+x\d+' | uniq)

    # 使用 fzf 选择分辨率
    set selected_resolution (printf "%s\n" $resolutions | fzf --prompt="Select a resolution: ")

    # 如果没有选择任何分辨率，退出脚本
    if test -z "$selected_resolution"
        echo "No resolution selected."
        exit 1
    end

    # 设置所选显示器的分辨率
    xrandr --output $selected_monitor --mode $selected_resolution

    echo "Set $selected_monitor to $selected_resolution"

end
