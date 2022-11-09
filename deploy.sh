#!/bin/bash

PATH_TO_DOC_REPO=""

for doc in $(ls docs); do
    network=$(echo $doc | cut -d _ -f 1)
    net_type=$(echo $doc | cut -d _ -f 2)
    doc_type=$(echo $doc | cut -d _ -f 3 | cut -d . -f 1)
    echo "Parsing $doc"
    echo $network
    echo $net_type
    echo $doc_type
    #Assumes the doc repo is organized by repo root -> network type (mainnet v testnet) -> chain -> docs.md
    doc_path="${PATH_TO_DOC_REPO}/${net_type}/${network}/${doc_type}.md"
    if [[ ! -d "${PATH_TO_DOC_REPO}/${net_type}/${network}" ]]; then
        mkdir "${PATH_TO_DOC_REPO}/${net_type}/${network}"
    fi
    echo "Copying $doc to $doc_path"
    cp "docs/$doc" "${PATH_TO_DOC_REPO}/${net_type}/${network}/${doc_type}.md"
done