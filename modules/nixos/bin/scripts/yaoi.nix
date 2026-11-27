''
  #!/bin/sh

  URL='https://api.nekosapi.com/v4/images/random/file?tags=yaoi,kissing&rating=safe'

  wget -q -O /tmp/yaoi.jpg "$URL"

  kitty +kitten icat /tmp/yaoi.jpg

  rm -f /tmp/yaoi.jpg

  exit 0
''
