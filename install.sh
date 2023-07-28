#!/usr/bin/env bash

if [ "$UID" -eq 0 ]; then
	sudo=
else
	sudo=sudo
fi

$sudo cp -a usr /
