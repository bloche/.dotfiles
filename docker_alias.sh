docker(){
    if [[ "$@" == "clean" ]]; then
        echo "Stopping all containers..."
        command docker stop $(docker ps -aq) 2> /dev/null
        echo "Removing all containers..."
        command docker rm $(docker ps -aq) 2> /dev/null
        echo "Removing unused networks..."
        command docker network prune -f 2> /dev/null
        echo "Removing dangling images..."
        command docker rmi $(docker images -qf dangling=true) 2> /dev/null
    else
        command docker "$@"
    fi
}
