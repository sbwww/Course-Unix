read -p "login name: " username
until [ $username = "linux" ]
do
    echo "wrong name"
    read -p "login name: " username
done
echo "Hello $username"