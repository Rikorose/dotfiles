function ff
    # This also ignores .git directories.
    find . -not \( -wholename "./.git" -prune \) -type f -name $argv
end
