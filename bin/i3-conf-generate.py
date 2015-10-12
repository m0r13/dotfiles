#!/usr/bin/env python

import os
import socket

HOST = {
    "moritz-desktop" : "desktop",
    "moritz-laptop" : "laptop",
}.get(socket.gethostname(), "unknown")

if __name__ == "__main__":
    f = open("/home/moritz/.i3/i3.conf")

    for line in f.readlines():
        line = line.strip("\n\r")
        if line.startswith("#include \"") and line.endswith("\""):
            filename = line.replace("#include \"", "")[:-1]
            filename = filename.replace("$host", HOST)
            print(open(os.path.join("/home/moritz/.i3", filename)).read().strip("\n\r"))
        else:
            print(line)

