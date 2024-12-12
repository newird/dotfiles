function fish_user_key_bindings

    ### key-bindings.fish ###
    #     ____      ____
    #    / __/___  / __/
    #   / /_/_  / / /_
    #  / __/ / /_/ __/
    # /_/   /___/_/ key-bindings.fish
    #
    # - $FZF_TMUX_OPTS
    # - $FZF_CTRL_T_COMMAND
    # - $FZF_CTRL_T_OPTS
    # - $FZF_ALT_C_COMMAND
    # - $FZF_ALT_C_OPTS

    status is-interactive; or exit 0


    # Key bindings
    # ------------
    function fzf_key_bindings

        function __fzf_defaults
            # $1: Prepend to FZF_DEFAULT_OPTS_FILE and FZF_DEFAULT_OPTS
            # $2: Append to FZF_DEFAULT_OPTS_FILE and FZF_DEFAULT_OPTS
            test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
            echo "--height $FZF_TMUX_HEIGHT --bind=ctrl-z:ignore" $argv[1]
            command cat "$FZF_DEFAULT_OPTS_FILE" 2>/dev/null
            echo $FZF_DEFAULT_OPTS $argv[2]
        end

        function fzf-file-widget -d "List files and folders"
            set -l commandline (__fzf_parse_commandline)
            set -lx dir $commandline[1]
            set -l fzf_query $commandline[2]
            set -l prefix $commandline[3]

            test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
            begin
                set -lx FZF_DEFAULT_OPTS (__fzf_defaults "--reverse --walker=file,dir,follow,hidden --scheme=path --walker-root='$dir'" "$FZF_CTRL_T_OPTS")
                set -lx FZF_DEFAULT_COMMAND "$FZF_CTRL_T_COMMAND"
                set -lx FZF_DEFAULT_OPTS_FILE ''
                eval (__fzfcmd)' -m --query "'$fzf_query'"' | while read -l r
                    set result $result $r
                end
            end
            if [ -z "$result" ]
                commandline -f repaint
                return
            else
                commandline -t ""
            end
            for i in $result
                commandline -it -- $prefix
                commandline -it -- (string escape $i)
                commandline -it -- ' '
            end
            commandline -f repaint
        end



        function fzf-cd-widget -d "Change directory"
            set -l commandline (__fzf_parse_commandline)
            set -lx dir $commandline[1]
            set -l fzf_query $commandline[2]
            set -l prefix $commandline[3]

            test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
            begin
                set -lx FZF_DEFAULT_OPTS (__fzf_defaults "--reverse --walker=dir,follow,hidden --scheme=path --walker-root='$dir'" "$FZF_ALT_C_OPTS")
                set -lx FZF_DEFAULT_OPTS_FILE ''
                set -lx FZF_DEFAULT_COMMAND "$FZF_ALT_C_COMMAND"
                eval (__fzfcmd)' +m --query "'$fzf_query'"' | read -l result

                if [ -n "$result" ]
                    cd -- $result

                    commandline -t ""
                    commandline -it -- $prefix
                end
            end

            commandline -f repaint
        end

        function __fzfcmd
            test -n "$FZF_TMUX"; or set FZF_TMUX 0
            test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
            if [ -n "$FZF_TMUX_OPTS" ]
                echo "fzf-tmux $FZF_TMUX_OPTS -- "
            else if [ $FZF_TMUX -eq 1 ]
                echo "fzf-tmux -d$FZF_TMUX_HEIGHT -- "
            else
                echo fzf
            end
        end

        bind \ct fzf-file-widget

        bind \ec fzf-cd-widget

        if bind -M insert >/dev/null 2>&1
            bind -M insert \ct fzf-file-widget
            bind -M insert \ec fzf-cd-widget
        end

        function __fzf_parse_commandline -d 'Parse the current command line token and return split of existing filepath, fzf query, and optional -option= prefix'
            set -l commandline (commandline -t)

            set -l prefix (string match -r -- '^-[^\s=]+=' $commandline)
            set commandline (string replace -- "$prefix" '' $commandline)

            eval set commandline $commandline

            if [ -z $commandline ]
                set dir '.'
                set fzf_query ''
            else
                set dir (__fzf_get_dir $commandline)

                if [ "$dir" = "." -a (string sub -l 1 -- $commandline) != '.' ]
                    set fzf_query $commandline
                else
                    set fzf_query (string replace -r "^$dir/?" -- '' "$commandline")
                end
            end

            echo $dir
            echo $fzf_query
            echo $prefix
        end

        function __fzf_get_dir -d 'Find the longest existing filepath from input string'
            set dir $argv

            if [ (string length -- $dir) -gt 1 ]
                set dir (string replace -r '/*$' -- '' $dir)
            end

            while [ ! -d "$dir" ]
                set dir (dirname -- "$dir")
            end

            echo $dir
        end

    end
    ### end: key-bindings.fish ###
    fzf_key_bindings
end
