# Requirements

### Debian / Ubuntu / Mint / PopOS

See [pico_setup.sh](https://github.com/raspberrypi/pico-setup/blob/master/pico_setup.sh).

### NixOS

Use the flake to download the required packages.

```bash
nix develop
# TEMP:
PICO_SDK_PATH=../submodules/pico-sdk/ ./compile.sh
```

# Usage 

Use ./compile.sh to compile
Use ./compile.sh u to compile and upload

Make sure to git submodule update --init --recursive
to ensure the pico-sdk is installed correctly
