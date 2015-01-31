#!/bin/bash

ssh -f -N moritz.hilscher@ssh-stud.hpi.uni-potsdam.de -L 2222:student.hpi.uni-potsdam.de:22
ssh -f -N mhilscher@localhost -p2222 -L 3000:sharelatex:3000

