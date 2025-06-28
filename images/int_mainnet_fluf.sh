#!/bin/bash

# --- Configuration ---
KEYPAIR_PATH="$HOME/.config/solana/id.json"
RECEIVER_ADDRESS="DjZuGdYN4msYrFmLaPoHiqVcfFrnzPTsEyBDfTWRCzgM"
METADATA_URI="https://ikrb01.github.io/images/metadata_FLUF.json"
RPC_URL="https://api.mainnet-beta.solana.com"

# Check if metaboss is installed
if ! command -v metaboss &> /dev/null
then
    echo "Error: metaboss CLI not found. Please install it first."
    exit 1
fi

echo "Minting FluffnuggetCoin NFT on Solana Mainnet..."

metaboss mint one \
  --keypair "$KEYPAIR_PATH" \
  --receiver "$RECEIVER_ADDRESS" \
  --external-metadata-uri "$METADATA_URI" \
  --rpc "$RPC_URL"

if [ $? -eq 0 ]; then
  echo "✅ NFT minted successfully!"
  echo "👉 Check your wallet or Solana Explorer."
else
  echo "❌ Minting failed. Check the error above."
fi
