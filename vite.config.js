import { defineConfig } from 'vite'
import nodePolyfills from 'vite-plugin-node-stdlib-browser'

export default () => {
    return defineConfig({
        base: '/',
        build: {
            outDir: './dist',
        },
        server: {
            strictPort: true,
            port: 8080
        },
        plugins: [nodePolyfills()]
    })
}
