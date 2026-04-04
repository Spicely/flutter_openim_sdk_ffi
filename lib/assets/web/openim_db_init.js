/**
 * OpenIM Database Bridge Initializer
 *
 * Loads the @openim/wasm-client-sdk database bridge which registers
 * all IndexedDB operations (initDB, getMessage, insertConversation, etc.)
 * as global window functions.
 *
 * The Go WASM module calls these via js.Global().Call() through exec.Exec().
 * This must execute BEFORE the Go WASM module starts making database calls.
 */
(async function () {
  try {
    const scriptSrc = document.currentScript ? document.currentScript.src : import.meta.url;
    const baseURL = scriptSrc.substring(0, scriptSrc.lastIndexOf('/'));
    
    const sdk = await import(baseURL + '/openim_sdk.mjs');
    sdk.getSDK({
      sqlWasmPath: baseURL + '/sql-wasm.wasm',
      debug: true,
    });
    console.log('[OpenIM DB Bridge] Database bridge initialized');
  } catch (error) {
    console.error('[OpenIM DB Bridge] Init failed:', error);
  }
})();
