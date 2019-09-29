#!/bin/bash
echo "starting pdf scanner"

do_pdf_filter() {
   echo "run filter $1"
   source $1
    ./pdf_filter.sh
}

export -f do_pdf_filter

while [ true ]; do
  sleep 15

  find /filters/ -iname '*.env' -type f -exec bash -c 'do_pdf_filter "$0"' {} \;
done
