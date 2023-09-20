function ff
    fzf --print0 | xargs -0 -o vim
end
