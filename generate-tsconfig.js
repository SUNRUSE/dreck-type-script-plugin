const fs = require(`fs`);
const path = require(`path`);

fs.writeFileSync(`./plugins/type-script/tsconfig.json`, JSON.stringify({
  extends: `../../tsconfig.json`,
  files: process.argv.slice(2).map(line => path.join(`..`, `..`, line)),
}));
