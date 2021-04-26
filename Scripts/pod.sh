V=$1

git fetch --tags

cd Example

if [ "$V" = "" ]
then
  sed s/VERSION//g Podfile.in > Podfile
else
  (git tag | grep "$V") && exit
  N=`echo $V | sed 's/\(\.[^0]\)/.1-nightly\1/'`
  sed s/VERSION/", '~> $N'"/g Podfile.in > Podfile
fi

pod install || exit

if [ "$V" = "" ]
then
  V=`egrep -o '(\d+\.)+\d+' Podfile.lock | head -1`
  (git tag | grep "$V") && exit
fi

echo "::set-output name=version::$V"
