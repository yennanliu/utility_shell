#!/bin/sh

echo 'show $PATH'
tr ':' '\n' <<< "$PATH"

echo '=================='

echo 'show $PATHONPATH'
tr ':' '\n' <<< "$PATHONPATH"
