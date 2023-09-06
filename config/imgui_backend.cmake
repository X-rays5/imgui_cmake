# Set up options to select backends
option(ENABLE_OPENGL2_BACKEND "Enable OpenGL2 backend" OFF)
option(ENABLE_OPENGL3_BACKEND "Enable OpenGL3 backend" OFF)
option(ENABLE_DX9_BACKEND "Enable DirectX 9 backend" OFF)
option(ENABLE_DX10_BACKEND "Enable DirectX 10 backend" OFF)
option(ENABLE_DX11_BACKEND "Enable DirectX 11 backend" OFF)
option(ENABLE_DX12_BACKEND "Enable DirectX 12 backend" OFF)
option(ENABLE_VULKAN_BACKEND "Enable Vulkan backend" OFF)
option(ENABLE_SDL2_BACKEND "Enable SDL2 backend" OFF)
option(ENABLE_SDL3_BACKEND "Enable SDL3 backend" OFF)

if(WIN32 AND NOT ENABLE_SDL_BACKEND)
    set(ENABLE_WIN32_BACKEND ON)
else()
    set(ENABLE_WIN32_BACKEND OFF)
endif()

# List of ImGui backend sources
set(IMGUI_BACKEND_SOURCES "")

if (ENABLE_OPENGL2_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_opengl2.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_opengl2.h)
endif()

if (ENABLE_OPENGL3_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_opengl3.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_opengl3.h)
endif()

if (ENABLE_DX9_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx9.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx9.h)
endif()

if (ENABLE_DX10_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx10.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx10.h)
endif()

if (ENABLE_DX11_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx11.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx11.h)
endif()

if (ENABLE_DX12_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx12.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_dx12.h)
endif()

if (ENABLE_VULKAN_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_vulkan.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_vulkan.h)
endif()

if (ENABLE_SDL2_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdl2.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdl2.h
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdlrenderer2.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdlrenderer2.h)
endif()

if (ENABLE_SDL3_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdl3.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdl3.h
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdlrenderer3.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_sdlrenderer3.h)
endif()

if (ENABLE_WIN32_BACKEND)
    list(APPEND IMGUI_BACKEND_SOURCES
        ${imgui_SOURCE_DIR}/backends/imgui_impl_win32.cpp
        ${imgui_SOURCE_DIR}/backends/imgui_impl_win32.h)
endif()