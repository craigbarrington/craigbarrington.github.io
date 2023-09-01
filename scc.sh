#!/bin/bash

clear
hdiutil attach http://02svrm001.scc.local/scc.dmg
sleep 3
if [ -d "/volumes/scc" ]; then
  echo "connected to scc.";
  sudo /volumes/scc/bootstrappr.sh
else
echo "ERROR! Volume not available"
exit 1
fi
exit 0
