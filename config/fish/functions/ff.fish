function ff
    fd -t f --hidden |
        fzf --ansi \
            --color "hl:-1:underline,hl+:-1:underline:reverse" \
            --delimiter : \
            --preview 'bat --color=always {1} ' \
            --bind 'enter:become(nvim {1})'
end
