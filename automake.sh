#!/bin/bash

function monitor() {

  while IFS=';' read -ra line; do
    file=${line[0]}
    folder=${line[1]}
    IFS=',' read -ra events <<< "${line[2]}"
    # may be some code to detect if the file have been removed.
    case ${file##*.} in
      jade )
        echo "Processs $folder$file with jade"
        jade "$folder$file"
      ;;
      less )
        echo "Processs $folder$file with lessc"
        lessc "$folder$file" "$folder${file%.less}.css"
      ;;
    esac
  done

}

inotifywait -mre modify,move,create --format="%f;%w;%e" . | monitor

