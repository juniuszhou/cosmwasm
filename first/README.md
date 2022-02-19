#

## get the code base
git clone https://github.com/CosmWasm/cw-examples
cd cw-examples
git fetch --tags
git checkout escrow-0.10.0
cd contracts/escrow

## compile erc20 
cd first-contract/contracts/erc20
RUSTFLAGS='-C link-arg=-s' cargo build --release --target wasm32-unknown-unknown


## start wasmd 
../scripts/setup.sh 


## store erc20 
wasmd tx wasm store first-contract/contracts/erc20/target/wasm32-unknown-unknown/release/cw_erc20.wasm --from validator --keyring-backend test  --chain-id testing --gas 2000000

## init a contract
