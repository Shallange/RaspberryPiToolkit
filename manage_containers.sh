#!/bin/bash

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

# Main script starts here
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
        echo "Usage: $0 {start|stop|check}"
        exit 1
esac
