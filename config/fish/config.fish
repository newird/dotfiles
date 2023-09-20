if status is-interactive
end

# environment
set -U fish_user_paths /home/newird/.cargo/bin $HOME/.local/bin 
# function
# auto update
function u
	sudo pacman -Syyu
end
# exec node
#if command -v node > /dev/null 2>&1  
#	node -v  > /dev/null 2>&1
#end
# use bar replace cat

#locale us
set -gx LC_CTYPE en_US.UTF-8

if command -v bat > /dev/null 2>&1  
	abbr -a ss bat
end
# safe rm
abbr -a rm rip 
abbr -a clean_trash rip --decompose
abbr -a rm_list rip --seance


# tmux serssion
abbr tn tmux new -s 
abbr ta tmux attach -t 
abbr tl tmux ls 
abbr tk tmux kill-session -t
# rg 
abbr -a rgg rg --glob 

# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --color=never --hidden'
set -gx FZF_DEFAULT_OPTS '--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --line-range :50 {}'"

set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never --hidden'
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -50'"


# my alias
abbr -a c clear
abbr -a gm git commit -m
abbr -a gck git checkout
abbr -a vv nvim 
abbr -a ac aicommits
abbr -a cf clangformat
abbr -a sf screenfetch
abbr -a gp rga
abbr -a cp uu-cp
abbr -a mv uu-mv
abbr -a of onefetch
abbr -a dg datagrip
abbr -a ca conda activate
abbr -a ou ouch decompress
#exa 
if command -v exa >> /dev/null
	abbr -a l exa
	abbr -a la exa -a
	abbr -a ll exa -l
	abbr -a ls exa -l
	abbr -a lll exa -la
end

# opam configuration
source /home/newird/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda/bin/conda
    eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

