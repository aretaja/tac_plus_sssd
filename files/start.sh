#!/bin/bash
echo "start tac_plus_sssd container"
ln -sf /dev/stdout /dev/console
CMD="tac_plus -C \"${CONFIG}\" -G -t -d \"${DEBUGLVL}\" -l \"${LOGFILE}\" 2>&1"

if [ "$FILTERREGEX" != '' ]
then
    CMD="${CMD} | grep  --line-buffered -vP '$FILTERREGEX'"
fi

echo "$CMD"
eval "$CMD"
