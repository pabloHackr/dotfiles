# Set some variables
wall_dir="${HOME}/Pictures/wallpapers/"
cacheDir="${HOME}/.cache/jp/${theme}"jp
rofi_command="rofi -dmenu -theme ${HOME}/.config/rofi/config.rasi -theme-str ${rofi_override}"

# Create cache dir if not exists
if [ ! -d "${cacheDir}" ] ; then
    mkdir -p "${cacheDir}"
fi

# Select a picture with rofi
wall_selection=$(find "${wall_dir}" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n" ; done | $rofi_command)

# Set the wallpaper
[[ -n "$wall_selection" ]] || exit 1
swww img ${wall_dir}/${wall_selection} --transition-type=outer

exit 0