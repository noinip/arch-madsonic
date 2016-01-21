**Application**

[Madsonic](http://beta.madsonic.org/pages/index.jsp)

**Application description**

Madsonic is a fork of the Subsonic 4.x Server, Madsonic is a full replacement for your current Subsonic server!, Madsonic is designed for people who want more from the vanilla Subsonic features.

**Build notes**

Latest stable release of Madsonic.

**Usage**
```
docker run -d \
	-p 4040:4040 \
	-p 4050:4050 \
	--name=<container name> \
	-e CONTEXT_PATH=<root path> \
	-e SSL=<yes|no> \
	-v <path for media files>:/media \
	-v <path for config files>:/config \
	-v /etc/localtime:/etc/localtime:ro \
	binhex/arch-madsonic
```

Please replace all user variables in the above command defined by <> with the correct values.

**Access application**

`http://<host ip>:4040`

**Example**
```
docker run -d \
	-p 4040:4040 \
	-p 4050:4050 \
	--name=madsonic \
	-e CONTEXT_PATH=\ \
	-e SSL=yes \
	-v /media/music/:/media \
	-v /apps/docker/madsonic:/config \
	-v /etc/localtime:/etc/localtime:ro \
	binhex/arch-madsonic
```

**Notes**

N/A

[Support forum](http://lime-technology.com/forum/index.php?topic=38055.0)