function cj
    echo $argv[1]
    if test (count $argv) -gt 0
        set filename $argv[1]
        if not test -f $filename
            echo "no such file: " $filename
            return
        end

        set base_name (basename $filename .cj)
        if not test -d out
            mkdir out
        end

        echo cjc $filename -j1 -g --save-temps=out -o $base_name
        cjc $filename -j1 -g --save-temps=out -o $base_name

        echo cjc $filename -j1 -g --emit-chir
        cjc $filename -j1 -g --emit-chir

        if not test -f default.chir
            echo "no chir file found"
            return
        end

        if not test -f out/$base_name.bc
            echo "no bc found"
            return
        end

        echo llvm-dis out/$base_name.bc
        llvm-dis out/$base_name.bc
    else
        echo "usage: cj file.cj"
    end
end
