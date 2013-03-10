#!/bin/sh
# mpex.sh: Simple shell script interface to mpex.co
# todo: url encode the command without the necessity of the escape "\" character.
# usage example: ./mpex.sh BUY\|S.DICE\|40000
# or: ./mpex.sh 'BUY|S.DICE|40000'
# don't forget the "!" after your keyID.
echo $* | gpg --clearsign -u yourkeyID! | gpg --armor -r CFE0F3E1 --trust-model always --encrypt | curl -s --data-urlencode msg@- http://mpex.coinbr.com | gpg -
