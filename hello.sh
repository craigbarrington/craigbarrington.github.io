#!/bin/bash

clear
hdiutil mount http://02svrm001.scc.local/adobe.dmg
sleep 3
if [ -d "/volumes/adobe" ]; then
  echo "connected to volume."
else
echo "ERROR! Volume not available
exit 1
fi
sleep 3
hdiutil unmount http://02svrm001.scc.local/adobe.dmg
exit 0
