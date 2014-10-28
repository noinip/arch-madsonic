#!/bin/sh

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
 
# copy over ffmpeg and other transcoders
mkdir -p /config/transcode
cp /var/madsonic/transcode/linux/* /config/transcode/