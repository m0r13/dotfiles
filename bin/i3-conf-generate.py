#!/usr/bin/env python

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
    }
    print(template.render(context))
