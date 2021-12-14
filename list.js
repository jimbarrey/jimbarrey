
function consoleLogRuns(runs) {
  // print min, avg, max, count
  const min = Math.min(...runs);
  const avg = runs.reduce((a, b) => a + b, 0) / runs.length;
  const max = Math.max(...runs);
  console.log(`min: ${min}, avg: ${avg}, max: ${max}, count: ${runs.length}`);
}



// will be 20
const supply = await greeter.totalSupply();

const list = await greeter.getOnSaleMap(0, supply);
expect(list.length).to.deep.equal(7);

const [tokenIds] = await greeter.getOnSaleTokenIds(0, supply);
expect(tokenIds.length).to.deep.equal(7);

const runsMap = [];

for (let index = 0; index < 1000; index++) {
  const before = performance.now();
  await greeter.getOnSaleMap(0, supply);
  const after = performance.now();
  runsMap.push(after - before);
}
consoleLogRuns(runsMap);

const runsTokenIds = [];
for (let index = 0; index < 1000; index++) {
  const before = performance.now();
  await greeter.getOnSaleTokenIds(0, supply);
  const after = performance.now();
  runsTokenIds.push(after - before);
}
consoleLogRuns(runsTokenIds);

/*
Minted 20, with 7 on sale
Method 1, getOnSaleMap: min: 4.196249961853027, avg: 4.9396929302215575, max: 7.715083003044128, count: 1000
Method 2, getOnSaleTokenIds: min: 4.039125084877014, avg: 4.722358561873436, max: 6.337499976158142, count: 1000
    ✓ mint a bunch of tokens (9963ms)

*/
