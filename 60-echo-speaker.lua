-- WirePlumber 0.4 only.
-- Replace AA_BB_CC_DD_EE_FF with your Echo's Bluetooth address,
-- using underscores instead of colons.

table.insert(bluez_monitor.rules, {
  matches = {
    {
      { "device.name", "equals",
        "bluez_card.AA_BB_CC_DD_EE_FF" },
    },
  },
  apply_properties = {
    ["device.profile"] = "a2dp-sink",
    ["bluez5.auto-connect"] = "[ a2dp_sink ]",
  },
})
