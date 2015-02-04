#!/bin/sh
cd /home/ghost/
exec npm start --production >>/var/log/blog.log 2>&1
echo "Servidor Node arrancado"
exit 0