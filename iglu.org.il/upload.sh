#!/bin/sh
RSYNC="rsync --rsh=ssh -a -v --progress --delete-after"
# $RSYNC mailing-lists shlomif@iglu.org.il:/iglu/html/
$RSYNC mailing-lists "${HOMEPAGE_SSH_PATH}"/Iglu/
$RSYNC mailing-lists hamakor:/srv/raid/http/hamakor.org.il/
