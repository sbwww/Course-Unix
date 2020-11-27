i=0
maxNumber=0
minNumber=999
sum=0
while [ $i -lt 20 ]
do
    read -p "" number
    if [ $number -gt $maxNumber ] ; then
        maxNumber=$number
    fi
    if [ $number -lt $minNumber ] ; then
        minNumber=$number
    fi
    sum=`expr $sum + $number`
    i=`expr $i + 1`
done
echo "max: " $maxNumber
echo "min: " $minNumber
echo "sum: " $sum