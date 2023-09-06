option(IMGUI_DISABLE_OBSOLETE_FUNCTIONS "Disable obsolete functions" ON)
option(IMGUI_DISABLE_OBSOLETE_KEYIO "1.87: disable legacy io.KeyMap[]+io.KeysDown[] in favor io.AddKeyEvent(). This will be folded into IMGUI_DISABLE_OBSOLETE_FUNCTIONS in a few versions." ON)

option(IMGUI_DISABLE_DEMO_WINDOWS "ShowDemoWindow()/ShowStyleEditor() will be empty." OFF)
option(IMGUI_DISABLE_DEBUG_TOOLS "ShowMetricsWindow(), ShowDebugLogWindow() and ShowStackToolWindow() will be empty" OFF)

option(IMGUI_DISABLE_WIN32_FUNCTIONS "Won't use and link with any Win32 function (clipboard, IME)" OFF)

option(IMGUI_ENABLE_FREETYPE_LUNASVG "Enable LunaSVG" ON)

option(IMGUI_DEBUG_PARANOID "Enable slower asserts" OFF)

if (IMGUI_DISABLE_OBSOLETE_FUNCTIONS)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_DISABLE_OBSOLETE_FUNCTIONS)
endif()

if (IMGUI_DISABLE_OBSOLETE_KEYIO)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_DISABLE_OBSOLETE_KEYIO)
endif()

if (IMGUI_DISABLE_DEMO_WINDOWS)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_DISABLE_DEMO_WINDOWS)
endif()

if (IMGUI_DISABLE_DEBUG_TOOLS)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_DISABLE_DEBUG_TOOLS)
endif()

if (IMGUI_DISABLE_WIN32_FUNCTIONS)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_DISABLE_WIN32_FUNCTIONS)
endif()

if (IMGUI_ENABLE_FREETYPE_LUNASVG)
    CPMAddPackage("gh:sammycage/lunasvg#9a05e196382ebe4ef7993039d069ab6312b60fac")
    target_link_libraries(${PROJECT_NAME} PRIVATE lunasvg)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_ENABLE_FREETYPE_LUNASVG)
endif()

if (IMGUI_DEBUG_PARANOID)
    target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_DEBUG_PARANOID)
endif()