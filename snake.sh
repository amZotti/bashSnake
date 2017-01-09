clear

declare -i -r X=0;
declare -i -r Y=1;
declare -a pos;

pos[$X]=0;
pos[$Y]=0;

drawCharacter() {
    clear

    for i in `seq 0 ${pos[$X]}`;do
        printf '\n'
    done

    for i in `seq 0 ${pos[$Y]}`;do
        printf ' '
    done

    printf '0\n'
}

go() {
    pos[$1]=$((${pos[$1]}+$2))
}

go_right() {
    go $Y 1
}

go_left() {
    go $Y -1
}

go_down() {
    go $X 1
}

go_up() {
    go $X -1
}

getInput() {
    read -s -n 1 key

    case "$key" in
        'a') go_left;;
        'd') go_right;;
        'w') go_up;;
        's') go_down;;
    esac
}

while true; do
    drawCharacter &
        getInput
done

