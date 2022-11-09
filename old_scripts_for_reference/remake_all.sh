#!/bin/bash

./parse.sh kujira kaiyo-1 .kujira kujirad 0.6.4 mainnet
echo "Kujira - Done"
./parse.sh stride stride-1 .stride strided 2.0.3 mainnet
echo "Stride - Done"
./parse.sh clan playstation-2 .clan cland 1.0.4-alpha testnet
echo "Clan - Done"
./parse.sh jackal jackal-1 .canine canined 1.1.2 mainnet
echo "Jackal - Done"

exit 0