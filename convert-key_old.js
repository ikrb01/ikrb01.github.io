const bs58 = require('bs58');
const fs = require('fs');

const base58Key = '6DizHPjnwHe7eZDyMRnRMXUUzDVDHjzEEmWnq7AkQDbv4EBStNafbSZrpR79jG9bLbvAmU18qRmasEbMzmWQZ5w';  // Replace with your key

const secretKey = bs58.decode(base58Key);
const array = Array.from(secretKey);

fs.writeFileSync('phantom-keypair.json', JSON.stringify(array));
console.log('Keypair JSON saved to phantom-keypair.json');
