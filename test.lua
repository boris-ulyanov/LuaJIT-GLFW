#!/usr/bin/luajit

-- Load libraries
local lj_glfw = require "glfw-gles"
local ffi = require "ffi"
local bit = require "bit"
-- Localize the FFI libraries
local gl, glc, glfw, glext = lj_glfw.libraries()

assert(pcall(function() local _ = glc.this_doesnt_exist end) == false)

-- Initialize GLFW. Unline glfwInit, this throws an error on failure
lj_glfw.init()

-- select appropriate context API
lj_glfw.hint(glc.GLFW_CLIENT_API, glc.GLFW_OPENGL_ES_API);
lj_glfw.hint(glc.GLFW_CONTEXT_VERSION_MAJOR, 2);

-- Creates a new window. lj_glfw.Window is a ctype object with a __new metamethod that
-- runs glfwCreateWindow.
-- The window ctype has most of the windows functions as methods
local window = lj_glfw.Window(400, 300, "LuaJIT-GLFW Test")

window:setKeyCallback(
  function(win,key,scan,action,mods)
    if (key==glc.GLFW_KEY_ESCAPE or key==glc.GLFW_KEY_Q) and action == glc.GLFW_PRESS then
      win:setShouldClose(true)
    end
  end
)

-- Initialize the context. This needs to be called before any OpenGL calls.
window:makeContextCurrent()

local ver = ffi.string(gl.glGetString(glc.GL_VERSION))
print("GL_VERSION = "..ver)

local c = 0
-- Main loop
while not window:shouldClose() do
	gl.glClearColor(c, c, c, 1.0)
	gl.glClear(glc.GL_COLOR_BUFFER_BIT)
	c = c + 1 / 200
	if c > 1 then c = 0 end

	window:swapBuffers()
	lj_glfw.pollEvents()
end

-- Destroy the window and deinitialize GLFW.
window:destroy()
lj_glfw.terminate()
