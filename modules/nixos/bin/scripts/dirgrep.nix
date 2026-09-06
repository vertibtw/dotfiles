''
  #!/bin/sh

  # Usage: ./find_string.sh "string" [directory]

  if [ -z "$1" ]; then
      echo "Usage: $0 \"string\" [directory]"
      exit 1
  fi

  if [ -z "$2" ]; then
      set -- "$1" "."
  fi

  grep -RIlF -- "$1" "$2" | while read -r file; do
      echo "File $file contains '$1'"
  done
''
