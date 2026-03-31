#!/bin/bash
# script 3: check disk usage and permissions for important dirs

dirs=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "Disk & Permission Auditor"
echo "-------------------------"

for d in "${dirs[@]}"; do
    if [ -d "$d" ]; then
        # extract permissions, owner, and group from ls output
        perms=$(ls -ld "$d" | awk '{print $1, $3, $4}')
        size=$(du -sh "$d" 2>/dev/null | awk '{print $1}')
        echo "$d -> Perms/Owner: $perms | Size: $size"
    else
        echo "$d doesn't exist on this machine"
    fi
done

echo ""
echo "--- VLC checks ---"
plugins_dir="/usr/lib/vlc/plugins"

if [ -d "$plugins_dir" ]; then
    # grab permissions and ownership details for the plugins directory
    p=$(ls -ld "$plugins_dir" | awk '{print $1, $3, $4}')
    s=$(du -sh "$plugins_dir" 2>/dev/null | awk '{print $1}')
    # count the number of shared object (.so) files in the plugins folder
    c=$(find "$plugins_dir" -name "*.so" 2>/dev/null | wc -l)
    
    echo "$plugins_dir:"
    echo "  Permissions: $p"
    echo "  Size: $s"
    echo "  Shared libs: $c"
    echo "  Info: VLC purposely drops root privileges when playing media."
else
    echo "VLC plugins not found at $plugins_dir"
fi

vlc_config="$HOME/.config/vlc"
echo ""
if [ -d "$vlc_config" ]; then
    p=$(ls -ld "$vlc_config" | awk '{print $1, $3, $4}')
    s=$(du -sh "$vlc_config" 2>/dev/null | awk '{print $1}')
    echo "User config ($vlc_config):"
    echo "  Perms: $p"
    echo "  Size: $s"
else
    echo "VLC config dir not found at $vlc_config"
fi
