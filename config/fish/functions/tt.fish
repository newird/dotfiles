function tt
    set selected_dir (fd -t d --hidden | fzf)

    # Exit if no directory was selected
    if test -z "$selected_dir"
        echo "No directory selected."
        return 1
    end

    # Extract the last directory name from the path using awk
    set session_name (echo "$selected_dir" | awk -F'/' '{print $(NF-1)}')

    # Check if a tmux session with that name already exists
    tmux has-session -t $session_name 2>/dev/null

    # If the exit status of the previous command was 0 (session exists)
    if test $status -eq 0
        if test -n "$TMUX"
            tmux switch-client -t $session_name # Switch to the chosen session if already inside tmux
        else
            tmux attach -t $session_name # Attach to the chosen session if outside tmux
        end
    else
        tmux new -s $session_name -c "$selected_dir" -d # Create the session detached
        if test -n "$TMUX"
            tmux switch-client -t $session_name # Switch to the new session if already inside tmux
        else
            tmux attach -t $session_name # Attach to the new session if outside tmux
        end
    end
end
