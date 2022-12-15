# napi-test

Create NodeJS modules in C with standalone CMakeLists + vcpkg

https://github.com/microsoft/vcpkg/pull/26768

### testing

```
docker build -t napitest .
docker run --rm napitest
```

### expected result
```
{ function: [Function: doSomethingUseful] }
{ result: undefined }
```