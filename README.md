# IMGUI CMake
A basic CMake script to use IMGUI with CMake. Basic configuration is available.

## Usage

### Select branch
```cmake
option(IMGUI_DOCKING_BRANCH "Branch of imgui_docking" OFF)
```

### Imgui config
```cmake
option(IMGUI_DISABLE_OBSOLETE_FUNCTIONS "Disable obsolete functions" ON)
option(IMGUI_DISABLE_OBSOLETE_KEYIO "1.87: disable legacy io.KeyMap[]+io.KeysDown[] in favor io.AddKeyEvent(). This will be folded into IMGUI_DISABLE_OBSOLETE_FUNCTIONS in a few versions." ON)

option(IMGUI_DISABLE_DEMO_WINDOWS "ShowDemoWindow()/ShowStyleEditor() will be empty." OFF)
option(IMGUI_DISABLE_DEBUG_TOOLS "ShowMetricsWindow(), ShowDebugLogWindow() and ShowStackToolWindow() will be empty" OFF)

option(IMGUI_DISABLE_WIN32_FUNCTIONS "Won't use and link with any Win32 function (clipboard, IME)" OFF)

option(IMGUI_ENABLE_FREETYPE_LUNASVG "Enable LunaSVG" ON)

option(IMGUI_DEBUG_PARANOID "Enable slower asserts" OFF)
```

### Backend selection
If sdl is not enabled win32 will be used.
```cmake
option(ENABLE_OPENGL2_BACKEND "Enable OpenGL2 backend" OFF)
option(ENABLE_OPENGL3_BACKEND "Enable OpenGL3 backend" OFF)
option(ENABLE_DX9_BACKEND "Enable DirectX 9 backend" OFF)
option(ENABLE_DX10_BACKEND "Enable DirectX 10 backend" OFF)
option(ENABLE_DX11_BACKEND "Enable DirectX 11 backend" OFF)
option(ENABLE_DX12_BACKEND "Enable DirectX 12 backend" OFF)
option(ENABLE_VULKAN_BACKEND "Enable Vulkan backend" OFF)
option(ENABLE_SDL2_BACKEND "Enable SDL2 backend" OFF)
option(ENABLE_SDL3_BACKEND "Enable SDL3 backend" OFF)
```