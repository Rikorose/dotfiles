function fd
    switch (count $argv)
    case 0
        set dir .
    case 1
        set dir $argv
    case 2
        set dir $argv[1]
        set name_arg -name $argv[2]
    end
    # This also ignores .git directories.
    find $dir -not \( -wholename "./.git" -prune \) -type d $name_arg
end
