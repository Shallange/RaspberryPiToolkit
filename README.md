# RaspberryPiToolkit

A versatile collection of scripts for Raspberry Pi, created to streamline personal projects.

## Getting Started

To use the scripts in this toolkit:

1. **Clone the Repository**:
    Clone this repository to your Raspberry Pi to get started with the toolkit.

2. **Navigate to the Toolkit Directory**:


    ```bash
    cd RaspberryPiToolkit
    ```

3. **Run the Scripts**:
   Execute the desired script. Replace `<ScriptName>.sh` with the name of the script you wish to run. Note that some scripts may require arguments, while others do not.

   ```bash
   ./<ScriptName>.sh <argument>
   ```

   If a script requires arguments and none are provided, it will typically display a message indicating what arguments are needed and possibly list available options or provide usage guidance.

## Using the Docker Management Script

The `manage_services.sh` script simplifies managing Docker containers for Node-RED and Grafana and is for simplifing the iot open academy chapter 6,7

#### Prerequisites for Docker Management Script

Ensure Docker is installed on your Raspberry Pi. If not, you can install Docker with:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```
#### Available Commands

- **Start Containers**:
    Start Docker containers for Node-RED and Grafana.

    ```bash
    ./manage_services.sh start
    ```

- **Check Container Status**:
    Check the running status of the Docker containers.

    ```bash
    ./manage_services.sh check
    ```

- **Stop Containers**:
    Stop the Docker containers.

    ```bash
    ./manage_services.sh stop
    ```


