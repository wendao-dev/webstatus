#!/bin/bash

SCDIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))
cd "$SCDIR"

if [ "$(tail -n 1 index.html)" != "</html>" ] ; then
	cat >> index.html <<'EOF'
</body>
</html>
EOF
fi

export GIT_SSH_COMMAND="ssh -i $(pwd)/uploadkey.pem"

git add .
git commit -a -m 'auto commit'
git push
