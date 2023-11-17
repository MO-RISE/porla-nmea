# porla-nmea
This is an extension to [`porla`](https://github.com/MO-RISE/porla)

## What

This extension provides functionality to handle ~~NMEA0183~~, NMEA2000 and LWE450 data

### Built-in functionality

* `lwe450` - Support for interfacing (listening/sending) to LWE450 multicast networks

### 3rd-party tools

* All binaries provided by the `canboat` project, see here: https://github.com/canboat/canboat/wiki#programs-included-in-canboat
* The `ais-decode` command line utility from the `pyais`package: https://github.com/M0r13n/pyais

## Usage

### Examples

```yaml
version: '3.8'

services:
    source_1:
        image: ghcr.io/mo-rise/porla
        network_mode: host
        restart: always
        command: ["socat UDP4-RECV:1457,reuseaddr STDOUT | to_bus 1"]

    transform_1:
        image: ghcr.io/mo-rise/porla-nmea
        network_mode: host
        restart: always
        command: ["from_bus 1 | analyzer --json | to_bus 3"]
```
