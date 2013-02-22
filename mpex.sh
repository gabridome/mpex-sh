#!/bin/sh
# mpex.sh: Simple shell script interface to mpex.co
# todo: url encode the command without the necessity of the escape "\" character.
# usage example: ./mpex.sh BUY\|S.DICE\|40000
# don't forget the "!" after your keyID.
echo "$*" | gpg --clearsign -u yourKeyID! | gpg --encrypt --armor -r F1B69921 --trust-model always > out.txt
curl -s --data-urlencode msg@out.txt http://mpex.co >out.asc
gpg --batch --yes out.asc
cat out
