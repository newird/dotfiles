function ktt
    # Function to list sessions sorted by most recently used
    function get_sessions_by_mru
        tmux list-sessions -F '#{session_last_attached} #{session_name}' | sort --numeric-sort --reverse | awk '{print $2}'
    end

    # Launch fzf to select a tmux session to kill
    set SESSION_NAME (get_sessions_by_mru | fzf \
        --preview 'tmux list-windows -t {}' \
        --preview-window=right:50%:wrap \
        --prompt "Kill session> " \
        --color "fg:#c678dd,bg:#1e222a,hl:#c678dd" \
        --color "fg+:#ffffff,bg+:#56b6c2,hl+:#ff6c6b" \
        --color "info:#98c379,prompt:#61afef,pointer:#d19a66,marker:#e5c07b,spinner:#61afef,header:#61afef" \
        --border \
        --height 60% \
        --layout=default \
        --cycle)

    # If a session is selected (press enter)
    if test -n "$SESSION_NAME"
        # Kill the selected tmux session
        tmux kill-session -t $SESSION_NAME
    end
end
