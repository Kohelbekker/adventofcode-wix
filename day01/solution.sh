#!/usr/local/bin/bash

input='./input'
count=0;

declare -A numbers
numbers["zero"]=0
numbers["one"]=1
numbers["two"]=2
numbers["three"]=3
numbers["four"]=4
numbers["five"]=5
numbers["six"]=6
numbers["seven"]=7
numbers["eight"]=8
numbers["nine"]=9

string_to_number() {
  if [[ numbers["zero"] ]]
}

while read -r line; do
  num_line=$(echo $line | grep -E -i -o '[0-9]|one|zero|two|three|four|five|six|seven|eight|nine')

  no_whitespace=$(echo "${num_line}" | tr -d " \t\n\r")
  if [[ -z $num_line || -z $no_whitespace ]]; then
    continue
  fi

  readarray -t new_arr <<<"$num_line"

  first_digit=$(echo ${new_arr[0]})
  second_digit=$(echo ${new_arr[-1]})

  echo "new_arr: ${new_arr[*]}"

  echo "${first_digit} ${second_digit}"

  # ${#num_line} - returns length of the string
  if [[ ${#num_line} -eq 1 ]]; then
    num=$(( $num_line * 10 + $num_line ))
  else
    first_digit=$(echo $num_line | cut -c1)
    second_digit=$(echo $num_line | rev | cut -c1)
    num=$(( first_digit * 10 + second_digit ))
  fi
  count=$(expr $count + $num)
done < $input

echo $count
