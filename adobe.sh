#!/bin/bash

clear
hdiutil attach http://02svrm001.scc.local/adobe.dmg
sleep 3
if [ -d "/volumes/adobe" ]; then
  echo "connected to volume."
else
echo "ERROR! Volume not available"
exit 1
fi
exit 0
