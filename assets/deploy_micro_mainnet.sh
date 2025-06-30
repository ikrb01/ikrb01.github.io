#!/bin/bash

set -e

echo "🗂️  Uploading assets to Arweave..."
sugar upload --mainnet

echo "🚀 Deploying Candy Machine to Mainnet..."
sugar deploy --mainnet

echo "🔍 Verifying upload..."
sugar verify_upload --mainnet

echo "🧪 Minting 1 NFT to test..."
sugar mint_one --mainnet

echo "✅ Micro deployment complete!"
