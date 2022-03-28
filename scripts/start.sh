rm -rf "$HOME"/.wasmd
rm -rf /tmp/wasmd.log

# init the wasmd config in ~/.wasmd/
wasmd init --chain-id test admin
# add validator for block production
wasmd keys add validator --keyring-backend test 
# add genesis account and its tokens
wasmd add-genesis-account validator "1000000000stake,1000000000cosmos" --keyring-backend test 
# tx for validator to staking
wasmd gentx validator "250000000stake" --chain-id=test --amount="250000000stake" --keyring-backend test 
# collect tx for start the chain
wasmd collect-gentxs
# start the chain
wasmd start --rpc.laddr tcp://localhost:26657 --trace > /tmp/wasmd.log  2>&1 &
