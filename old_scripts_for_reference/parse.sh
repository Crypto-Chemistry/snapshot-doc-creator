#!/bin/bash -e

TEMPLATE=""

if [[ $# != 6 ]]; then
    printf 'Please enter the following positional arguments: $CHAIN $CHAIN_ID $CHAIN_HOME $CHAIN_DAEMON $CHAIN_VERSION $CHAIN_TYPE\n'
    exit 1
fi

CHAIN=$1
CHAIN_ID=$2
CHAIN_HOME=$3
CHAIN_DAEMON=$4
CHAIN_VERSION=$5
CHAIN_TYPE=$6

docpath="$(dirname $TEMPLATE)/docs/${CHAIN}_${CHAIN_TYPE}_snapshot.md"

cp "$TEMPLATE" "$docpath"

sed -i "0,/{CHAIN}/s/{CHAIN}/${CHAIN^}/" "$docpath"
sed -i "0,/{CHAIN_TYPE}/s/{CHAIN_TYPE}/${CHAIN_TYPE^}/" "$docpath"
sed -i "s/{CHAIN}/$CHAIN/g" "$docpath"
sed -i "s/{CHAIN_ID}/$CHAIN_ID/g" "$docpath"
sed -i "s/{CHAIN_HOME}/$CHAIN_HOME/g" "$docpath"
sed -i "s/{CHAIN_DAEMON}/$CHAIN_DAEMON/g" "$docpath"
sed -i "s/{CHAIN_VERSION}/$CHAIN_VERSION/g" "$docpath"
sed -i "s/{CHAIN_TYPE}/$CHAIN_TYPE/g" "$docpath"