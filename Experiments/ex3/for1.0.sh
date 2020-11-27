declare -a array=(1 2 3 4 5)
for i in 1 2 3 4 5
do
    echo "${array[$i-1]}"
done