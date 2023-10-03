function stt
    # Function to list sessions sorted by most recently used
    function get_sessions_by_mru
        tmux list-sessions -F '#{session_last_attached} #{session_name}' | sort --numeric-sort --reverse | awk '{print $2}'
    end


    # Launch fzf with the tmux sessions
    set SESSION_NAME (get_sessions_by_mru | fzf --preview 'tmux list-windows -t {}' --preview-window=up:5:wrap --prompt "sessions> ")

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
