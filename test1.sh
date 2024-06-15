for device in $(lsblk | grep -v '/' | tail +2 | egrep -v 'disk | rom' | egrep -v '[0-9]K' | awk '{ print $1 }' | sed 's/^..//')
do
    var1=/media/dir_$device
    test -d $var1 && var1=/media/secdir_$device
    mkdir $var1
    mount /dev/$device  $var1
    find $var1 -mtime +15 | tail +2 | xargs rm -rf
done
