#!/bin/sh
cd /home/ghost/
exec NODE_ENV=production forever start index.js
echo "Servidor Node arrancado"
exit 0