# Fish completion for cjc

function __cjc_using_command
    for cmd in cjc cjc-frontend
        if contains $cmd (commandline -opc)
            return 0
        end
    end
    return 1
end

complete -c cjc -f -a "(cjc --list-commands)" -d "Cangjie Compiler command"
complete -c cjc-frontend -f -a "(cjc-frontend --list-commands)" -d "Cangjie Frontend command"
