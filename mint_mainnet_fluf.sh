#!/bin/bash

# Set variables
ASSETS_DIR="./assets"
KEYPAIR_PATH="$HOME/.config/solana/id.json"
CONFIG_FILE="./config.json"
CACHE_NAME="astroferret"
RPC="https://api.mainnet-beta.solana.com"

# Set Solana to mainnet
solana config set --url "$RPC"

# Upload assets
npx ts-node js/packages/cli/src/candy-machine-v3-cli.ts upload \
  -e mainnet-beta \
  -k "$KEYPAIR_PATH" \
  --cache-name "$CACHE_NAME" \
  --config "$CONFIG_FILE" \
  "$ASSETS_DIR"

# Create candy machine
npx ts-node js/packages/cli/src/candy-machine-v3-cli.ts create_candy_machine \
  -e mainnet-beta \
  -k "$KEYPAIR_PATH" \
  --cache-name "$CACHE_NAME"

# Mint 3 NFTs to your wallet
for i in {1..3}; do
  echo "Minting NFT #$i..."
  npx ts-node js/packages/cli/src/candy-machine-v3-cli.ts mint_one_token \
    -e mainnet-beta \
    -k "$KEYPAIR_PATH" \
    --cache-name "$CACHE_NAME"
  sleep 2
done

echo "✅ Done! Check your wallet on Solana Explorer: https://explorer.solana.com/address/$(solana address)?cluster=mainnet-beta"

