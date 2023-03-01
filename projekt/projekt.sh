#!/bin/bash

DEFAULT_X_DIR="./X"
SOURCE=()
TASK_LIST=()        # Task list used to have all hyperparameters set before executing
FASTFORWARD=0       # for default, fast-forward option is not set

printstate () {
    echo $DEFAULT_X_DIR
    echo $SOURCE
    echo $TASK_LIST
    echo $FASTFORWARD
}


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
            shift
            ;;
        -m | --move)
            TASK_LIST+=("MOVE")
            shift
            ;;
        -c | --copy)
            TASK_LIST+=("COPY")
            shift
            ;;
        -d | --duplicates)
            TASK_LIST+=("DUPLICATES")
            shift
            ;;
        -e | --empty)
            TASK_LIST+=("EMPTY")
            shift
            ;;
        -t | --temporary)
            TASK_LIST+=("TEMPORARY")
            shift
            ;;
        -n | --namesake)
            TASK_LIST+=("NAMESAKE")
            shift
            ;;
        -p | --permissions)
            TASK_LIST+=("PERMISSIONS")
            shift
            ;;
        -s | --symbols)
            TASK_LIST+=("SYMBOLS")
            shift
            ;;
        -r | --rename)
            TASK_LIST+=("RENAME")
            shift
            ;;
        -f | --fastforward)
            FASTFORWARD=1
            shift
            ;;
        -*)
            echo "Invalid option $1" 1>&2   # print error on cerr
            exe_help
            ;;
        *)
            SOURCE+=("$1")
            shift;
            ;;
    esac
done


printstate
