foo=sun
echo $fooshine     # $fooshine is undefined
echo ${foo}

#!/bin/sh
echo -en "What is your name [ `whoami` ] "
read myname
if [ -z "$myname" ]; then
  myname=`whoami`
fi
# echo "Your name is : $myname"
echo "Your name is : ${myname:=John Doe}"

