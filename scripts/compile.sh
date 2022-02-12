#

## clone contract from github
git clone  https://github.com/CosmWasm/cw-plus

## compile 
RUSTFLAGS='-C link-arg=-s' cargo build --release --target wasm32-unknown-unknown

## deploy
wasmd 