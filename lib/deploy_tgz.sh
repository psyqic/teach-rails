#!/bin/sh

TEMP_DIR=`dirname $1`
TGZ_FILE=`basename $1`
APP_DIR=`echo $TGZ_FILE | sed 's/\.tgz//'`
PORT=$2

# cd $TEMP_DIR

tar xvfz ${TEMP_DIR}/${TGZ_FILE} -C ${TEMP_DIR}
cd ${TEMP_DIR}/${APP_DIR}
ruby ${TEMP_DIR}/${APP_DIR}/script/rails s --port=$PORT -d

#rm $TGZ_FILE
# cd demo

#ruby script/server --port=$PORT -d

