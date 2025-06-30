#!/bin/bash

set -e

ASSETS_DIR="."

echo "🗂️  Uploading assets to Arweave..."
sugar upload $ASSETS_DIR --rpc-url https://api.mainnet-beta.solana.com

echo "🚀 Deploying Candy Machine to Mainnet..."
sugar deploy --rpc-url https://api.mainnet-beta.solana.com

echo "🔍 Verifying upload..."
sugar verify_upload --rpc-url https://api.mainnet-beta.solana.com

echo "🧪 Minting 1 NFT to test..."
sugar mint_one --rpc-url https://api.mainnet-beta.solana.com

echo "✅ Micro deployment complete!"
