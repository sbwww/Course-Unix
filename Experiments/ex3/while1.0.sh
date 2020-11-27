while [ 1 ]
do
    read -p "input your number: " number
    if [ $number = "88" ] ; then
        echo "Accepted"
        break
    else
        echo "Wrong Answer"
    fi
done