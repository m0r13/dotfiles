#!/usr/bin/env python3

import os
import socket

from jinja2 import Environment, FileSystemLoader

if __name__ == "__main__":
    env = Environment(loader=FileSystemLoader("/home/moritz/.i3"))
    template = env.get_template("config.tpl")

    hostname = socket.gethostname()
    context = {
        "desktop" : hostname == "moritz-desktop",
        "laptop" : hostname == "moritz-laptop",
        "bp" : hostname == "BP2016D1WS06-Linux"
    }
    print(template.render(context))
