## cpp build using zig build system

A simple zig build and run

``` bash
zig build run
```

target wasm32-wasi

``` bash
zig build -Dtarget=wasm32-wasi
```

execute wasm binary using wasmtime

``` bash
wasmtime zig-out/bin/zig-cpp.wasm
```

test in browser

``` bash
pnpm dev
```

Awesome!