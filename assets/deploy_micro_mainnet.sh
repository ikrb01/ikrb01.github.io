#!/bin/bash

set -e

echo "🗂️  Uploading assets to Arweave..."
sugar upload --env=mainnet-beta

echo "🚀 Deploying Candy Machine to Mainnet..."
sugar deploy --env=mainnet-beta

echo "🔍 Verifying upload..."
sugar verify_upload --env=mainnet-beta

echo "🧪 Minting 1 NFT to test..."
sugar mint_one --env=mainnet-beta

echo "✅ Micro deployment complete!"
