PASSWORD=${1234567890:-1234567890}
STAKE=${STAKE_TOKEN:-ustake}
FEE=${FEE_TOKEN:-ucosm}
CHAIN_ID=${CHAIN_ID:-testing}
MONIKER=${MONIKER:-node001}

rm -rf "$HOME"/.wasmd

wasmd init --chain-id "$CHAIN_ID" "$MONIKER"

sed -i "s/\"stake\"/\"$STAKE\"/" "$HOME"/.wasmd/config/genesis.json

sed -i "s/\"stake\"/\"$STAKE\"/" "$HOME"/.wasmd/config/genesis.json

sed -i 's/"time_iota_ms": "1000"/"time_iota_ms": "10"/' "$HOME"/.wasmd/config/genesis.json

wasmd keys add validator --keyring-backend test 
wasmd add-genesis-account validator "1000000000ustake,1000000000ucosm" --keyring-backend test 

wasmd gentx validator "250000000$STAKE" --chain-id="$CHAIN_ID" --amount="250000000$STAKE" --keyring-backend test 
wasmd collect-gentxs


