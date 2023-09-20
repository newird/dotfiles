function uninstall
	sudo pacman -Ss $argv[1] | grep installed| awk -F' ' '{gsub(/^(core|community|extra|aur|archlinuxcn|blackarch)\//,"",$1); print $1}'
end
