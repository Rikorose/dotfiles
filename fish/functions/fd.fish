function ff
    # This also ignores .git directories.
    find . -not \( -wholename "./.git" -prune \) -type d -name $argv
end
