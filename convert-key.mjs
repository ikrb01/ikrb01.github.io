import bs58 from 'bs58';
import { writeFileSync } from 'fs';

// Replace this with your Phantom private key (base58 format)
const base58Key = '';
//
const secretKey = bs58.decode(base58Key);
const array = Array.from(secretKey);

writeFileSync('phantom-keypair.json', JSON.stringify(array));
console.log('✅ Saved as phantom-keypair.json');
