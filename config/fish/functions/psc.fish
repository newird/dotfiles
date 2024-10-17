function psc
    set package (pacman -Qe | fzf --multi | awk '{print $1}') # Use fzf to choose a package and extract the package name
    if test -n "$package" # Check if a package was selected
        for p in $package
            sudo pacman -Rsc $p
        end
    else
        echo "No package selected"
    end
end
