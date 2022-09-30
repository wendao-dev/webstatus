#!/bin/bash

SCDIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))
cd "$SCDIR"

if [ "$(tail -n 1 index.html)" != "</html>" ] ; then
	cat >> index.html <<'EOF'
</body>
</html>
EOF
fi

if [ ! -f "~/.ssh/uploadkey.pem" ] ; then
	cp $(pwd)/uploadkey.pem ~/.ssh/uploadkey.pem
	chmod 600 ~/.ssh/uploadkey.pem
fi
export GIT_SSH_COMMAND="ssh -i ~/.ssh/uploadkey.pem"

if [ -n "$(git diff)" ] ; then
	git add .
	git commit -a -m 'auto commit by bot'
	git push
fi
