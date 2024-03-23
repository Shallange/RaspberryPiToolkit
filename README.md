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
