# Amazon Echo Dot Bluetooth workaround for Linux Mint

A WirePlumber 0.4 configuration that prefers the Echo’s A2DP
speaker profile and automatically connects that profile.

## Symptoms

The Echo pairs, but audio fails or it connects as an audio
gateway instead of a playback speaker.

## Tested setup

- Linux Mint 22.3
- BlueZ 5.72
- PipeWire 1.0.5
- WirePlumber 0.4.17

This configuration uses WirePlumber 0.4’s Lua format.
It is not directly compatible with WirePlumber 0.5.

## Installation

1. Pair your Echo through Bluetooth settings.

2. Find its Bluetooth address:

   ```bash
   bluetoothctl devices
   ```

3. Download `60-echo-speaker.lua` from this repository.
   Replace `AA_BB_CC_DD_EE_FF` inside it with your Echo’s
   address, using underscores instead of colons.

4. Install the edited file:

   ```bash
   mkdir -p ~/.config/wireplumber/bluetooth.lua.d
   cp ~/Downloads/60-echo-speaker.lua \
      ~/.config/wireplumber/bluetooth.lua.d/
   systemctl --user restart wireplumber
   ```

5. Reconnect the Echo and select it in Sound Settings.

## Verification

Playback and reconnection without re-pairing worked in testing.
The Echo remained connected for one minute after playback stopped.

Long-term stability and shutdown/restart behavior were not
confirmed during testing. This is a workaround, not a guaranteed
fix for every Echo Bluetooth problem.

## Undo

```bash
rm ~/.config/wireplumber/bluetooth.lua.d/60-echo-speaker.lua
systemctl --user restart wireplumber
```
