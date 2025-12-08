function stt
    # Function to list sessions sorted by most recently used
    function get_sessions_by_mru
        tmux list-sessions -F '#{session_last_attached} #{session_name}' | sort --numeric-sort --reverse | awk '{print $2}'
    end

    # Launch fzf with the tmux sessions
    set SESSION_NAME (get_sessions_by_mru | sk \
        --preview 'tmux list-windows -t {}' \
        --preview-window=right:50%:wrap \
        --prompt "sessions> " \
        --color "fg:#c678dd,bg:#1e222a,hl:#c678dd" \
        --color "fg+:#ffffff,bg+:#56b6c2,hl+:#ff6c6b" \
        --color "info:#98c379,prompt:#61afef,pointer:#d19a66,marker:#e5c07b,spinner:#61afef,header:#61afef" \
        --border \
        --height 60% \
        --layout=default \
        --cycle)

    # If a session is selected (press enter)
    if test -n "$SESSION_NAME"
        # Check if inside a tmux session
        if test -n "$TMUX"
            tmux switch-client -t $SESSION_NAME # Switch to the chosen session
        else
            tmux attach -t $SESSION_NAME # Attach to the chosen session
        end
    end
end
