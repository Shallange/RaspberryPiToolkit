#!/bin/bash

function display_usage(){
    echo "Usage: $0 <option>"
    echo "Try '$0 --help' for more information."
}

# display usage instructions
function display_help(){
    echo "Usage: $0 <option>"
    echo "- start: Start the service."
    echo "- stop: Stop the service."
    echo "- check: Check the service status."
    echo "- --help: Display this help message."
}
# check if no arguments were provided and display usage
if [[ -z "$1" ]]; then
    display_usage
    exit 0
# check if the first argument is "--help" and display detailed help
elif [[ "$1" == "--help" ]]; then
    display_help
    exit 0
fi

# Function to start Node-RED
start_node_red() {
    echo "Starting Node-RED container..."
    sudo docker start NodeRED || docker run -d -p 1880:1880 --name NodeRED -v nodered_data:/data nodered/node-red
    echo "Node-RED started."
}

# Function to start Grafana
start_grafana() {
    echo "Starting Grafana container..."
    sudo docker start Grafana || docker run -d -p 3001:3000 -e "GF_INSTALL_PLUGINS=https://github.com/IoTOpen/grafana-datasource-lynx/archive/2.2.1.zip;iotopen-datasource" -e "GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=iotopen-datasource" --name Grafana -v grafana_data:/var/lib/grafana grafana/grafana:latest
    echo "Grafana started."
}

# Function to check if the containers are running
check_containers() {
    echo "Checking if containers are running..."
    sudo docker ps | grep "NodeRED"
    sudo docker ps | grep "Grafana"
}

# Function to stop Node-RED and Grafana containers
stop_containers() {
    echo "Stopping Node-RED container..."
    sudo docker stop NodeRED
    echo "Node-RED container stopped."

    echo "Stopping Grafana container..."
    sudo docker stop Grafana
    echo "Grafana container stopped."
}

# Main script, handling script arguments to start, stop or check services
case "$1" in
    start)
        start_node_red
        start_grafana
        ;;
    stop)
        stop_containers
        ;;
    check)
        check_containers
        ;;
    *)
	# Handles any unspecified arguments by showing the usage message
        echo "Invalid command or no command provided"
	display_usage
        exit 1
esac
