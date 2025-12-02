
CONFIG_FILE="${SYNOPKG_PKGVAR}/navidrome.toml"
SERVICE_COMMAND="${SYNOPKG_PKGDEST}/bin/navidrome --port ${SERVICE_PORT} --configfile=${CONFIG_FILE}"
SVC_WRITE_PID=y
SVC_BACKGROUND=y

service_postinst ()
{
    # update config with values from wizard variables
    # Construct MusicFolder path: if subfolder is set, append it; otherwise use root share path
    if [ -n "${wizard_music_subfolder}" ]; then
        MUSIC_FOLDER="${SHARE_PATH}/${wizard_music_subfolder}"
    else
        MUSIC_FOLDER="${SHARE_PATH}"
    fi
    sed -e "s|@@wizard_music_folder@@/@@wizard_music_subfolder@@|${MUSIC_FOLDER}|g" \
        -i "${CONFIG_FILE}"
}
