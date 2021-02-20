#!/bin/bash

APP_NAME="Xeams"
SHORTNAME="xeams"
DEFAULT_HOME="/opt/"
DEFAULT_DIR="$APP_NAME"
INNER_TAR_NAME="Xeams.tar"
SM_TAR_NAME="$INNER_TAR_NAME.gz"
APPFULL="Xeams SMTP Server and Spam Filter"

echo "[.] Installing $APP_NAME. "

cp $SM_TAR_NAME tmp$SM_TAR_NAME

if [ ! -f $SM_TAR_NAME ]
then
	echo "[*] $SM_TAR_NAME not found with package, Installation... [FAILED]"
	exit 1
fi

INSTALL_WHERE=$DEFAULT_HOME

echo "[.] Installation directory = $INSTALL_WHERE"
echo -n "[.] Unzipping $SM_TAR_NAME file... "

gzip -df9 $SM_TAR_NAME

if [ $? -eq 1 ]
then
	echo "[FAILED]"
	exit 1
else
	echo "[OK]"
fi

mv tmp$SM_TAR_NAME $SM_TAR_NAME

if [ ! -d $INSTALL_WHERE$DEFAULT_DIR ]
then
	echo "[.] Creating $INSTALL_WHERE$DEFAULT_DIR folder..."
	mkdir -pv $INSTALL_WHERE$DEFAULT_DIR
fi

echo -n "[.] Extracting $INNER_TAR_NAME file..."
tar -xf $INNER_TAR_NAME -C $INSTALL_WHERE$DEFAULT_DIR

if [ $? -eq 1 ]
then
	echo "[FAILED]"
	exit 1
else
	echo "[OK]"
fi

chmod -R u+wrx $INSTALL_WHERE$DEFAULT_DIR
rm -rf $INNER_TAR_NAME

