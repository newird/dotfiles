if status is-interactive
    # atuin
    if command -v atuin >> /dev/null
     atuin init fish | source
    end
    if command -v zoxide>> /dev/null
    zoxide init fish | source
    end
    if command -v starship >> /dev/null
    starship init fish | source
    end
    if command -v sk>> /dev/null
    sk --shell fish | source
    end
    if command -v direnv>> /dev/null
    direnv hook fish | source
    end
end

## fish t for tmux
set -gx PATH $HOME/.local/bin $PATH
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/git/fzf-fuzzy/bin
fish_add_path $GOPATH/bin
fish_add_path $HOME/.pixi/bin
fish_add_path $HOME/.bun/bin
# >>> coursier install directory >>>
fish_add_path $HOME/.local/share/coursier/bin
# <<< coursier install directory <<<
# pnpm
# opam configuration
source $HOME/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

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

# docker
abbr -a pc podman-compose
abbr -a lzd lazydocker
#locale us
set -gx LC_CTYPE en_US.UTF-8
# editor
set -gx EDITOR nvim
set -gx VISUAL nvim
# for neovide since it's no-fork for now
# https://github.com/neovide/neovide/issues/2597
set -gx NEOVIDE_FORK 1
# for tauri
set -gx WEBKIT_DISABLE_DMABUF_RENDERER 1

# use mold as linker
set -gx LD /usr/bin/mold
# ghostty
set -gx TERM xterm-256color

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

# ssh
#abbr -a ssh kitten ssh
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
set -gx FZF_CTRL_T_OPTS "--no-height --walker-skip .git,node_modules,target \
                          --preview 'fzf-preview.sh {} ' \
                          --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b"

set -gx FZF_ALT_C_COMMAND 'fd --type d . --color=never --hidden'
set -gx FZF_ALT_C_OPTS "--no-height --preview 'eza --tree --level=2 --icons {}' \
                        --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b"
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
abbr -a cf clang-format
abbr -a sf fastfetch
abbr -a ou ouch decompress
abbr -a pxy proxychains
## uu
if command -v uu-cp >> /dev/null
     source $HOME/.config/fish/alias/uu.fish
end
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


set _base_cmake_cmd "cmake -S . -B build -G Ninja"
set _compilers "-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang"
set _export_compile_commands "-DCMAKE_EXPORT_COMPILE_COMMANDS=1"
if command -v sccache >/dev/null
    set launcher "-DCMAKE_C_COMPILER_LAUNCHER=sccache -DCMAKE_CXX_COMPILER_LAUNCHER=sccache"
    abbr -a ca $_base_cmake_cmd $compilers $_export_compile_commands $launcher
else if command -v ccache >/dev/null
    set launcher "-DCMAKE_C_COMPILER_LAUNCHER=ccache -DCMAKE_CXX_COMPILER_LAUNCHER=ccache"
    abbr -a ca $_base_cmake_cmd $_compilers $_export_compile_commands $launcher
else
    abbr -a ca $_base_cmake_cmd $_compilers $_export_compile_commands
end
