#!/bin/sh

#create folders on config
mkdir -p /config/media/incoming
mdkir -p /config/media/podcast
mkdir -p /config/playlists/import
mkdir -p /config/playlists/export
mkdir -p /config/playlists/backup
mkdir -p /config/plugins/transcode

#copy transcode to config directory
cp /var/madsonic/transcode/linux/* /config/plugins/transcode/

#set default media locations
sed -i -e 's/MADSONIC_DEFAULT_MUSIC_FOLDER=\/var\/media\/artists/MADSONIC_DEFAULT_MUSIC_FOLDER=\/media/g' /var/madsonic/madsonic.sh
sed -i -e 's/MADSONIC_DEFAULT_UPLOAD_FOLDER=\/var\/media\/incoming/MADSONIC_DEFAULT_UPLOAD_FOLDER=\/config\/media\/incoming/g' /var/madsonic/madsonic.sh
sed -i -e 's/MADSONIC_DEFAULT_PODCAST_FOLDER=\/var\/media\/podcast/MADSONIC_DEFAULT_PODCAST_FOLDER=\/config\/media\/podcast/g' /var/madsonic/madsonic.sh
sed -i -e 's/MADSONIC_DEFAULT_PLAYLIST_IMPORT_FOLDER=\/var\/media\/playlists\/import/MADSONIC_DEFAULT_PLAYLIST_IMPORT_FOLDER=\/config\/playlists\/import/g' /var/madsonic/madsonic.sh
sed -i -e 's/MADSONIC_DEFAULT_PLAYLIST_EXPORT_FOLDER=\/var/media\/playlists\/export/MADSONIC_DEFAULT_PLAYLIST_EXPORT_FOLDER=\/config\/playlists\/export/g' /var/madsonic/madsonic.sh
sed -i -e 's/MADSONIC_DEFAULT_PLAYLIST_BACKUP_FOLDER=\/var\/media\/playlists\/backup/MADSONIC_DEFAULT_PLAYLIST_BACKUP_FOLDER=\/config\/playlists\/backup/g' /var/madsonic/madsonic.sh

# enable/disable ssl based on env variable set from docker container run command
 if [ $SSL == "yes" ]; then
        echo "Enabling SSL for Madsonic"
        /var/madsonic/madsonic.sh --home=/config --host=0.0.0.0 --https-port=4050

 elif [ $SSL == "no" ]; then
        echo "Disabling SSL for Madsonic"
        /var/madsonic/madsonic.sh --home=/config --host=0.0.0.0 --port=4040

 else
        echo "SSL not defined, defaulting to disabled"
        /var/madsonic/madsonic.sh --home=/config --host=0.0.0.0 --port=4040

 fi
 