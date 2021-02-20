#!/bin/bash

if [ ! -d "/opt/Xeams/config" ]; then
	cd /opt
	bash ./docker-install.sh
fi

cd /opt/Xeams

CP=

for i in `ls lib/*.jar`
do
	CP=$CP:$i
done

echo $CP

ulimit -n 8192

jre/bin/java -server -Xmx1024m -cp $CP -DLoggingConfigFile=logconfig.xml com.synametrics.xeams.ServerStarter
