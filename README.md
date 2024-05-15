# RaspberryPiToolkit

## Getting Started

To use the scripts in this toolkit:

1. **Clone the Repository**:
    Clone this repository to your Raspberry Pi to get started with the toolkit.

2. **Navigate to the Toolkit Directory**:

    ```bash
    cd RaspberryPiToolkit
    ```

3. **Run the Scripts**:
   Execute the desired script. Replace `<ScriptName>.sh` with the name of the script you wish to run. Many scripts support arguments, and some may require them.

   ```bash
   ./<ScriptName>.sh <argument>
   ```

   If you're unsure what arguments a script accepts or what functionality it provides, you can typically append `--help` to the script command to display usage information:

   ```bash
   ./<ScriptName>.sh --help
   ```

## Using the Docker Management Script

The `manage_services.sh` script simplifies managing Docker containers for Node-RED and Grafana, ideal for streamlining IoT projects based on the IoT Open Academy chapters 6 and 7.

#### Prerequisites for Docker Management Script

Ensure Docker is installed on your Raspberry Pi. If not, you can install Docker with:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
```

#### Discovering Script Commands

To explore what commands `manage_services.sh` (or any other script) supports, including how to start, stop, and check the status of services, you can use the `--help` option:

```bash
./manage_services.sh --help
```

This command will display detailed information about the script's available options and usage instructions, enabling you to fully utilize its functionality without needing to refer back to this README for basic command syntax.

## Customizing Script Settings

The scripts provided in this toolkit are designed to be flexible and customizable. If you need to change certain settings such as Docker ports or data storage paths, you can easily modify the script files to fit your specific requirements.

### Modifying Docker Ports and Storage Paths

Our `manage_services.sh` script handles the management of Docker containers for Node-RED and Grafana. By default, the script is set up with predefined ports and Docker volumes. However, you can modify these settings directly in the script.

#### Example Customizations

1. **Node-RED:**

   The default setup for Node-RED uses port `1880`. If this port is already in use on your system, or if you prefer to use a different port, you can change it in the `start_node_red` function:

   ```bash
   # Original line in start_node_red function:
   sudo docker start NodeRED || docker run -d -p 1880:1880 --name NodeRED -v nodered_data:/data nodered/node-red

   # Modified line for a new port (e.g., 1890):
   sudo docker start NodeRED || docker run -d -p 1890:1880 --name NodeRED -v nodered_data:/data nodered/node-red
   ```

2. **Grafana:**

   Grafana is configured to run on port `3001`. If you need to use a different port, adjust it in the `start_grafana` function:

   ```bash
   # Original line in start_grafana function:
   sudo docker start Grafana || docker run -d -p 3001:3000 -e "GF_INSTALL_PLUGINS=https://github.com/IoTOpen/grafana-datasource-lynx/archive/2.2.1.zip;iotopen-datasource" --name Grafana -v grafana_data:/var/lib/grafana grafana/grafana:latest

   # Modified line for a new port (e.g., 3002):
   sudo docker start Grafana || docker run -d -p 3002:3000 -e "GF_INSTALL_PLUGINS=https://github.com/IoTOpen/grafana-datasource-lynx/archive/2.2.1.zip;iotopen-datasource" --name Grafana -v grafana_data:/var/lib/grafana grafana/grafana:latest
   ```

3. **Changing Docker Volume Paths:**

   If you wish to change where Docker containers store their data on your Raspberry Pi, modify the volume paths in the Docker run commands:

   ```bash
   # For Node-RED:
   sudo docker start NodeRED || docker run -d -p 1880:1880 --name NodeRED -v /your/custom/path:/data nodered/node-red

   # For Grafana:
   sudo docker start Grafana || docker run -d -p 3001:3000 --name Grafana -v /your/custom/path:/var/lib/grafana grafana/grafana:latest
   ```

### Documentation and Help

For more information about Docker commands and managing ports or volumes, refer to the [Docker documentation](https://docs.docker.com/). If you need help with the scripts, remember that running the script with the `--help` option provides guidance on usage and available commands.

