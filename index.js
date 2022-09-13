const testAddon = require("./build/Debug/test.node");

console.log({ function: testAddon.doSomethingUseful });

const result = testAddon.doSomethingUseful();

console.log({ result });