#!/bin/bash

# === SETUP ===
ASSETS_DIR="./assets"
KEYPAIR="$HOME/.config/solana/id.json"
RPC_URL="https://api.mainnet-beta.solana.com"

cd "$(dirname "$0")" || exit 1

# === 1. Upload assets to Arweave ===
echo "📤 Uploading assets..."
sugar upload \
  --assets "$ASSETS_DIR" \
  --keypair "$KEYPAIR" \
  --rpc-url "$RPC_URL" || { echo "❌ Upload failed"; exit 1; }

# === 2. Verify ===
echo "🔍 Verifying upload..."
sugar verify \
  --keypair "$KEYPAIR" \
  --rpc-url "$RPC_URL" || { echo "❌ Verify failed"; exit 1; }

# === 3. Deploy Candy Machine ===
echo "🎰 Deploying Candy Machine..."
sugar deploy \
  --keypair "$KEYPAIR" \
  --rpc-url "$RPC_URL" || { echo "❌ Deploy failed"; exit 1; }

# === 4. Mint 1 NFT to your wallet ===
echo "🪙 Minting NFT to your wallet..."
sugar mint \
  --keypair "$KEYPAIR" \
  --rpc-url "$RPC_URL" || { echo "❌ Minting failed"; exit 1; }

# === DONE ===
echo "✅ Minting complete!"
solana address --keypair "$KEYPAIR" | xargs -I{} echo "👉 View: https://explorer.solana.com/address/{}?cluster=mainnet-beta"

