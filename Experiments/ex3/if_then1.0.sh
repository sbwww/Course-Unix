read -p "input your name: " name
if [ $name = linux ] ; then
    read -p "input your password: " password
    if [ $password = "123456" ] ; then
        echo "Hello $name"
    else
        echo "Wrong password"
    fi
else
    echo "Wrong name"
fi