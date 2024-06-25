function tt
    # Select a directory using fd and fzf with a preview
    set selected_dir (fd -t d --hidden | fzf --preview='eza  --tree --level=2 {}' \
      --preview-window=right:60%:wrap \
      --prompt "Select a directory: " \
     --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
     --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
      --border \
      --layout=default \
      --cycle)

    # Exit if no directory was selected
    if test -z "$selected_dir"
        echo "No directory selected."
        return 1
    end

    # Extract session name from the selected directory
    set session_name (echo "$selected_dir" | awk -F'/' '{print $(NF-1)}')

    # Check if the tmux session already exists
    tmux has-session -t $session_name 2>/dev/null

    if test $status -eq 0
        # If the session exists and we're inside tmux, switch to it
        if test -n "$TMUX"
            tmux switch-client -t $session_name
        else
            # If the session exists and we're outside tmux, attach to it
            tmux attach -t $session_name
        end
    else
        # Create a new detached tmux session
        tmux new -s $session_name -c "$selected_dir" -d
        # If we're inside tmux, switch to the new session
        if test -n "$TMUX"
            tmux switch-client -t $session_name
        else
            # If we're outside tmux, attach to the new session
            tmux attach -t $session_name
        end
    end
end

# Abbreviation for creating a new tmux session with a sanitized session name
abbr -a tnn 'tmux new -s (string replace -r "^\." "" -- (basename (string trim -r -c "/" (pwd))))'
