if status is-interactive
    # atuin
    atuin init fish | source
    zoxide init fish | source
    starship init fish | source
    pixi completion --shell fish | source
end

## fish t for tmux
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/git/fzf-fuzzy/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.pixi/bin
fish_add_path $HOME/.bun/bin
# opam configuration
source $HOME/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

# bun

set fish_key_bindings fish_vi_key_bindings
bind yy fish_clipboard_copy
bind Y fish_clipboard_copy
bind p fish_clipboard_paste

# auto update
function u
    paru
end
abbr -a paru paru --bottomup
abbr -a pp paruz

# exec node
#if command -v node > /dev/null 2>&1
#	node -v  > /dev/null 2>&1
#end
# use bar replace cat

#locale us
set -gx LC_CTYPE en_US.UTF-8

if command -v bat >/dev/null 2>&1
    abbr -a ss bat
end
# safe rm
if command -v rip >/dev/null 2>&1
    abbr -a rm rip
    abbr -a clean_trash rip --decompose
    abbr -a rm_list rip --seance
    abbr -a cz rip --unbury
    abbr -a recover rip --seance --unbury
end

# set  system clipboard
abbr -a clip xclip -sel clip
abbr -a co xclip -o

# download
abbr -a ww aria2c

# tmux serssion
abbr tn tmux new -s
abbr tnn 'tmux new -s (string replace -r "^\." "" -- (basename (string trim -r -c "/" (pwd))))'
abbr tl tmux ls
# rg
abbr -a rgg rg --glob
# fzf
set -gx FZF_DEFAULT_COMMAND 'fd --type f --color=never --hidden'
set -gx FZF_DEFAULT_OPTS '--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
set -gx FZF_CTRL_T_OPTS "--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b"

set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never --hidden'
set -gx FZF_ALT_C_OPTS "--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b"
# git abbr

abbr -a gm git commit
abbr -a gmm git commit -m
abbr -a gsb git switch
abbr -a gsu git submodule update --init --recursive
abbr -a gc git clone
abbr -a gcr git clone --recurse-submodules
abbr -a gg lazygit

# for cd
abbr -a ... cd ../..
abbr -a .... cd ../../..
abbr -a ..... cd ../../../..

# my alias
abbr -a c clear
abbr -a vv nvim
abbr -a vd neovide
abbr -a ac aicommits
abbr -a cf clangformat
abbr -a sf screenfetch
abbr -a gp rga
abbr -a ou ouch decompress
## uu
source $HOME/.config/fish/alias/uu.fish
#eza
if command -v eza >>/dev/null
    abbr -a l eza
    abbr -a la eza -a
    abbr -a ll eza -la
    abbr -a ls eza -l
    abbr -a lll eza -la --icons
    abbr -a lg eza -la --icons --git
    abbr -a lt eza -la --icons --tree --long --level=2
end
