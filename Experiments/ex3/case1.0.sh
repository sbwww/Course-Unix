echo "Year 2020"
read -p "input month: " month
case $month in
    1|3|5|7|8|10|12)
        echo "31 days" ;;
    4|6|9|11)
        echo "30 days" ;;
    2)
        echo "29 days" ;;
    *)
        echo "error" ;;
esac