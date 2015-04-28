# LuaJIT-GLFW for OpenGL ES

Fork [LuaJIT-GLFW](https://github.com/ColonelThirtyTwo/LuaJIT-GLFW) for use with OpenGL ES API



## What changed

- Result file `glfw.lua` renamed to `glfw-gles.lua`
- Delete binding to GLU

Therefore, the code from original version:

```lua
local gl, glc, glu, glfw, glext = luajit_glfw.libraries()
-- Or if you just need the libraries:
local gl, glc, glu, glfw, glext = require('glfw').libraries()
```

Must be changed to:

```lua
local gl, glc, glfw, glext = luajit_glfw.libraries()
-- Or if you just need the libraries:
local gl, glc, glfw, glext = require('glfw-gles').libraries()
```
