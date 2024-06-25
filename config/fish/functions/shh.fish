function shh
    function get_host
        cat ~/.ssh/config | rg "Host " | cut -d ' ' -f 2
    end

    set HOST_NAME (get_host | fzf \
      --preview "cat ~/.ssh/config | rg -A 10 'Host {}' | while read line; switch \$line; case 'Host *'; if string length -q \$HOST; echo \$USER@\$HOSTNAME:\$PORT; return; end; set HOST (echo \$line | awk '{print \$2}'); set HOSTNAME ''; set PORT 22; set USER (whoami); case '*HostName *'; set HOSTNAME (echo \$line | awk '{print \$2}'); case '*Port *'; set PORT (echo \$line | awk '{print \$2}'); case '*User *'; set USER (echo \$line | awk '{print \$2}'); end; end; if string length -q \$HOST; echo \$USER@\$HOSTNAME:\$PORT; end" \
      --preview-window=right:60%:wrap \
      --prompt "hosts> " \
      --color "fg:#c678dd,bg:#1e222a,hl:#c678dd" \
      --color "fg+:#ffffff,bg+:#56b6c2,hl+:#ff6c6b" \
      --color "info:#98c379,prompt:#61afef,pointer:#d19a66,marker:#e5c07b,spinner:#61afef,header:#61afef" \
      --border \
      --height 30% \
      --layout=default \
      --cycle)

    if string length -q $HOST_NAME
        ssh $HOST_NAME
    end
end
