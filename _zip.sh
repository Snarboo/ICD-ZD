NAME=icd-zd
TYPE=pk3
echo -n \
'Would you like to build a pk3 or pk7?
PK-7 (7Zip package) is slower to decompress but much smaller [requires 7za]
PK-3 (ZIP package) is faster to decompress but bigger [requires zip]
[pk3]: '; read TYPE2

if [ $TYPE2 == '' ]; then
  echo 'Defaulting to pk3.'
else
  TYPE=$TYPE2
fi

cd _pk3

case $TYPE in
  pk7) 7za a -t7z ../$NAME.pk7 *
  ;;
  pk3) zip -r ../$NAME.pk3 *
  ;;
  *) echo 'Invalid type.'; exit 1
  ;;
esac
echo "Created $NAME.$TYPE"
