#!/bin/bash

DEFAULT_X_DIR="./X"


exe_help () {
    cat << EOF
Usage: projekt.sh [OPTION]... DIRECTORIES...
    -h  --help          Display help message
    -x  --set_dir       Specify target directory X
    -m  --move          Move files to directory X
    -c  --copy          Copy files to directory X
    -d  --duplicates    Remove duplicates
    -e  --empty         Remove empty files
    -t  --temporary     Remove temporary files
    -n  --namesake      Preserve the newest of namesake files
    -p  --permissions   Set permissions to default
    -s  --symbols       Substitute problematic symbols with pre-chosen ('.')
    -r  --rename        Enable hot-plugged file rename
    -f  --fastforward   Do not interact with caller: use default choices
EOF
    exit 0;
}


while test $# -gt 0
do
    case $1 in
        -h | --help)
            exe_help
            ;;
        -x | --set_dir)
            DEFAULT_X_DIR = $2
            shift
            ;;
        -*)
            echo $1
            shift;
            ;;
    esac
done

echo $#