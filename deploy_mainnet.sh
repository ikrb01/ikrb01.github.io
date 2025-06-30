#!/bin/bash
set -e

ASSETS_DIR="/home/i_v_a/ikrb01.github.io/assets"
KEYPAIR_PATH="$HOME/.config/solana/id.json"
ENV="mainnet-beta"
NFT_COUNT=100
AUTO_MINT=true
MINT_AMOUNT=5

echo "Deploying Metaplex Candy Machine on Solana $ENV..."

# Upload assets
pnpm exec ts-node packages/cli/src/candy-machine-v3-cli.ts upload $ASSETS_DIR \
  --env $ENV --keypair $KEYPAIR_PATH

  # Verify upload
  pnpm exec ts-node packages/cli/src/candy-machine-v3-cli.ts verify $ASSETS_DIR \
    --env $ENV --keypair $KEYPAIR_PATH

    # Deploy Candy Machine
    pnpm exec ts-node packages/cli/src/candy-machine-v3-cli.ts deploy \
      --env $ENV --keypair $KEYPAIR_PATH

      if [ "$AUTO_MINT" = true ]; then
        echo "Auto-minting $MINT_AMOUNT NFTs..."
          for i in $(seq 1 $MINT_AMOUNT); do
              pnpm exec ts-node packages/cli/src/candy-machine-v3-cli.ts mint_one_token \
                    --env $ENV --keypair $KEYPAIR_PATH
                      done
                      fi

                      echo "Deployment complete!"
                      echo "Now you can list your collection on Magic Eden or your favorite marketplace."

