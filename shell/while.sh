# !/bin/bash
# while display a serial number

count=1
while [[ $count -le 5 ]]; do
  #statements
  echo $count
  count=$((count+1))
done
echo "finished"
