const testAddon = (binaryDir) => {
  const winRequirePath = "./" + binaryDir + "/Debug/test.node";
  const linuxRequirePath = "./" + binaryDir + "/test.node";
  const testAddon = require(process.platform === "win32" ? winRequirePath : linuxRequirePath);

  console.log({ function: testAddon.doSomethingUseful });

  const result = testAddon.doSomethingUseful();

  console.log({ result });
}

// One of them should fail cause you can't have x86 and x64 nodejs in same time
testAddon('build');
//testAddon('build32');