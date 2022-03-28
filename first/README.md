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
wasmd tx wasm store first-contract/contracts/erc20/target/wasm32-unknown-unknown/release/cw_erc20.wasm --from validator --keyring-backend test  --chain-id testing --gas 20000000 --yes

## init a contract
// init message data format for erc20
'{"name":"erc20","symbol":"jun","decimals":18,"initial_balances":[],}'

wasmd tx wasm instantiate 2 '{"name":"erc20","symbol":"JUN","decimals":18,"initial_balances":[]}'  --label lit --from validator --keyring-backend test  --chain-id testing --gas 20000000 --yes

## call a contract
wasmd tx wasm execute "wasm19qws2lfd8pskyn0cfgpl5yjjyq3msy5402qr8nkzff9kdnkaepyqycedfh" \
'{"mint": {"recipient":"wasm1a3e3g9hnan4kltzt4p0w3eyhedtd5ynqusask5", "amount": "500000000"}}' \



## query

