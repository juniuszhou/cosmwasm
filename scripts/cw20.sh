




## check validator's address
 wasmd keys show validator -a --keyring-backend test

## store the contract to wasmd
wasmd tx wasm store target/wasm32-unknown-unknown/release/cw20_base.wasm --from validator --keyring-backend test --chain-id testing

