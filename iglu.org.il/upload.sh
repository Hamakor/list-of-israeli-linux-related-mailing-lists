#!/bin/sh
RSYNC="rsync --rsh=ssh -a -v --progress --delete-after"
# $RSYNC mailing-lists shlomif@iglu.org.il:/iglu/html/
$RSYNC mailing-lists "${HOMEPAGE_SSH_PATH}"/Iglu/
$RSYNC mailing-lists "${__HOMEPAGE_REMOTE_PATH}"/Iglu/
$RSYNC mailing-lists gnu.hamakor.org.il:/home/www/iglu.org.il/
