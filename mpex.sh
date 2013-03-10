#!/bin/sh
# mpex.sh: Simple shell script interface to mpex.co
# todo: url encode the command without the necessity of the escape "\" character.
# usage example: ./mpex.sh BUY\|S.DICE\|40000
# or: ./mpex.sh 'BUY|S.DICE|40000'
# don't forget the "!" after your keyID.

# Please put here your key ID
MYKEYID=
# this is the key of mpex mkt
MKTKEYID=CFE0F3E1  
MKTWEBSITE=http://mpex.coinbr.com
echo $* | gpg --clearsign -u $MYKEYID! | gpg --armor -r $MKTKEYID --trust-model always --encrypt | curl -s --data-urlencode msg@- $MKTWEBSITE | gpg -
