import { init, WASI } from "@wasmer/wasi";
import { lowerI64Imports } from "@wasmer/wasm-transformer"

document.addEventListener("DOMContentLoaded", async () => {
  await init();

  // Instantiate a new WASI Instance
  let wasi = new WASI({
    args: [],
    env: {},
    bindings: {
      // uses browser APIs in the browser, node APIs in node
      ...WASI.defaultBindings,
    }
  });

  // Fetch our Wasm File
  const response = await fetch("./zig-out/bin/zig-cpp.wasm");
  const responseArrayBuffer = await response.arrayBuffer();

  // Instantiate the WebAssembly file
  const wasm_bytes = new Uint8Array(responseArrayBuffer).buffer;
  const lowered_wasm = await lowerI64Imports(wasm_bytes);
  let module = await WebAssembly.compile(lowered_wasm);
  let instance = await WebAssembly.instantiate(module, {
    ...wasi.getImports(module)
  });

  // Start the WebAssembly WASI instance!
  const exitCode = wasi.start(instance);

  const stdout = wasi.getStdoutString();
  console.log(`${stdout}(exit code: ${exitCode})`);
});