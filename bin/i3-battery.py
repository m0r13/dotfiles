#!/usr/bin/env python

import sys

key_prefix = "POWER_SUPPLY_"

for line in sys.stdin.readlines():
    line = line.strip()
    if not line:
        continue
    bat0, bat1 = line.split("\t")
    key0, value0 = bat0.split("=")
    key1, value1 = bat1.split("=")
    assert key0 == key1
    key = key0

    # whether values are a number
    number = True
    try:
        value0 = int(value0)
        value1 = int(value1)
    except ValueError:
        number = False
    if key == key_prefix + "SERIAL_NUMBER":
        number = False

    # determine output value
    value = None
    if number:
        if key == key_prefix + "PRESENT":
            value = max(value0, value1)
        elif key == key_prefix + "CYCLE_COUNT":
            value = value0 # hmm?
        elif key in map(lambda a, p=key_prefix: p + a, ("POWER_NOW", "ENERGY_FULL_DESIGN", "ENERGY_FULL", "ENERGY_NOW")):
            value = value0 + value1
        elif key in map(lambda a, p=key_prefix: p + a, ("VOLTAGE_MIN_DESIGN", "VOLTAGE_NOW", "CAPACITY")):
            value = (value0 + value1) / 2
    else:
        value = value0
        if value == "Unknown":
            value = value1

    if value is None:
        print("#%s=%s,%s" % (key, value0, value1))
    else:
        print("%s=%s" % (key, value))
