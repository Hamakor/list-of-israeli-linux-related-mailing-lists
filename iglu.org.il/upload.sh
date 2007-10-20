#!/bin/sh
RSYNC="rsync --rsh=ssh -r -v --progress"
# $RSYNC mailing-lists shlomif@iglu.org.il:/iglu/html/
$RSYNC mailing-lists "${HOMEPAGE_SSH_PATH}"/Iglu/
