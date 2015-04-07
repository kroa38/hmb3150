#!/bin/sh

for i in `pidof dropbear | tr " "`; do kill $i; done;

exit 0;
