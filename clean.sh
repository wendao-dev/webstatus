#!/bin/bash

SCDIR=$(dirname $(realpath "${BASH_SOURCE[0]}"))
echo $SCDIR
cd "$SCDIR"

cat > index.html <<'EOF'
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>daily status</title>
</head>
<body>
EOF
