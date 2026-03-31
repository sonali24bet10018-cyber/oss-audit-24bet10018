#!/bin/bash

pkg="vlc"

echo "Checking for $pkg..."

# Prefer dnf (Fedora)
if command -v dnf &> /dev/null; then
    if rpm -q "$pkg" &> /dev/null; then
        echo "Status: Installed"
        rpm -qi "$pkg" | egrep 'Version|License|Summary'
    else
        echo "Status: Not installed"
        echo "Run: sudo dnf install $pkg"
    fi

# Then check apt (Debian/Ubuntu)
elif command -v apt &> /dev/null; then
    if dpkg -s "$pkg" &> /dev/null; then
        echo "Status: Installed"
        dpkg -s "$pkg" | egrep 'Version|Homepage|Description'
    else
        echo "Status: Not installed"
        echo "Run: sudo apt install $pkg"
    fi

else
    echo "error: no supported package manager found."
    exit 1
fi
