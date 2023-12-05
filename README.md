## cpp build using zig build system

A simple zig build and run

``` bash
zig build run
```

target wasm32-wasi

``` bash
zig build -Drelease-small -Dtarget=wasm32-wasi
```

execute wasm binary using wasmtime

``` bash
wasmtime zig-out/bin/zig-cpp.wasm
```

test with python http server

``` bash
python -m http.server 8080
```

Awesome!