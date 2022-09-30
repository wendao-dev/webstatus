#!/bin/bash

SCDIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))
cd "$SCDIR"

cat >> index.html <<'EOF'
</body>
</html>
EOF

git add .
git commit -a -m 'auto commit'
git push
