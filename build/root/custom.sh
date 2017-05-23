#!/bin/bash

# exit script if return code != 0
set -e

# create destination directories
mkdir -p /opt/madsonic/media
mkdir -p /opt/madsonic/transcode

# download madsonic standalone
curly.sh -rc 6 -rw 10 -of /opt/madsonic/madsonic.zip -url "http://www.madsonic.org/download/6.1/20160915_madsonic-6.1.8700-standalone.zip"

# download madsonic transcode
curly.sh -rc 6 -rw 10 -of /opt/madsonic/transcode/transcode.zip -url "http://www.madsonic.org/download/transcode/20160915_madsonic-transcode-linux-x64.zip"

# unzip madsonic and transcode
unzip /opt/madsonic/madsonic.zip -d /opt/madsonic
unzip /opt/madsonic/transcode/transcode.zip -d /opt/madsonic/transcode

# remove source zip files
rm /opt/madsonic/madsonic.zip
rm /opt/madsonic/transcode/transcode.zip
