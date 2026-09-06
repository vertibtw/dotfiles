''
#!/bin/sh

URL='https://api.nekosapi.com/v4/images/random/file?tags=yuri,kissing&rating=safe'

wget -q -O /tmp/yuri.jpg "$URL"

kitty +kitten icat /tmp/yuri.jpg

rm -f /tmp/yuri.jpg

exit 0
''
