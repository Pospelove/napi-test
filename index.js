const testAddon = (binaryDir) => {
  const testAddon = require("./" + binaryDir + "/Debug/test.node");

  console.log({ function: testAddon.doSomethingUseful });

  const result = testAddon.doSomethingUseful();

  console.log({ result });
}

// One of them should fail cause you can't have x86 and x64 nodejs in same time
testAddon('build');
testAddon('build32');