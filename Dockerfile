FROM binhex/arch-base:2015030300
MAINTAINER binhex

# additional files
##################

# download madsonic
ADD http://www.madsonic.org/download/5.2/20141214_madsonic-5.2.5420-standalone.zip /opt/madsonic/madsonic.zip

# download madsonic transcode pack
ADD http://www.madsonic.org/download/transcode/20141214_madsonic-transcode_latest_x64.zip /opt/madsonic/transcode/transcode.zip

# add install bash script
ADD install.sh /root/install.sh

# copy start bash script to madsonic dir (checks ssl enabled/disabled and copies transcoders to madsonic install dir)
ADD start.sh /opt/madsonic/start.sh

# add supervisor conf file for app
ADD madsonic.conf /etc/supervisor/conf.d/madsonic.conf

# install app
#############

# make executable and run bash scripts to install app
RUN chmod +x /root/install.sh /opt/madsonic/start.sh && \
	/bin/bash /root/install.sh

# docker settings
#################

# set env variable for java
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk/jre

# map /config to host defined config path (used to store configuration from app)
VOLUME /config

# map /media to host defined media path (used to read/write to media library)
VOLUME /media

# expose port for http
EXPOSE 4040

# expose port for https
EXPOSE 4050

# run supervisor
################

# run supervisor
CMD ["supervisord", "-c", "/etc/supervisor.conf", "-n"]