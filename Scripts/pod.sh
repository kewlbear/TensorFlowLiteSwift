V=$1

cd Example

if [ "$V" = "" ]
then
  sed s/VERSION//g Podfile.in > Podfile
else
  sed s/VERSION/", '~> $V'"/g Podfile.in > Podfile
fi

pod install

if [ "$V" = "" ]
then
  V=`egrep -o '(\d+\.)+\d+' Podfile.lock | head -1`
fi

echo "::set-output name=version::$V"
