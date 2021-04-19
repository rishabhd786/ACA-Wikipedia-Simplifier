#!/bin/bash
chmod +777 5688bc90-ab36-4a02-b192-d2426572bc93
PKGNAME=$(./5688bc90-ab36-4a02-b192-d2426572bc93 | sed '1q;d' |awk '{print $3}')
F1=$(ls -c1 | sed '2q;d' |awk '{print $1}' )
F2=$(ls -c1 | sed '3q;d' |awk '{print $1}' )
chmod +777 deploy $F1 $F2
./deploy $F1 $PKGNAME $F2 $1 >> submission-q1.txt