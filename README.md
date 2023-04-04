# napi-test

Create NodeJS modules in C with standalone CMakeLists + vcpkg

https://github.com/microsoft/vcpkg/pull/26768

### testing with docker

```
docker build -t napitest .
docker run --rm napitest
```

### testing under windows

In vcpkg:
```
./bootstrap-vcpkg.bat
vcpkg install node-api-headers:x64-windows
```

In napi-test:
```
mkdir build
cd build
cmake .. -A x64
cmake --build . --config Debug
node index.js
```

### expected result
```
{ function: [Function: doSomethingUseful] }
{ result: undefined }
```