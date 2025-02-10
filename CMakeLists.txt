cmake_minimum_required(VERSION 3.26)
project(imgui)

set(CMAKE_CXX_STANDARD 17)

include(get_cpm.cmake)

CPMAddPackage("gh:freetype/freetype#b1f47850878d232eea372ab167e760ccac4c4e32")

option(IMGUI_DOCKING_BRANCH "Branch of imgui_docking" OFF)
if (IMGUI_DOCKING_BRANCH)
    set(IMGUI_GIT_TAG "8679cfa2d88ca8c11b96706272d73f3f567b1bb9") # docking
else ()
    set(IMGUI_GIT_TAG "3b2f2602b4d6ecb0d7c09865dccbf8036afc002a") # master
endif ()

CPMAddPackage(
        NAME imgui
        GIT_REPOSITORY https://github.com/ocornut/imgui.git
        GIT_TAG ${IMGUI_GIT_TAG}
        DOWNLOAD_ONLY YES
)

if (NOT imgui_ADDED)
    message(FATAL_ERROR "Failed to fetch imgui")
endif ()

include(config/imgui_backend.cmake)

set(IMGUI_EXTRA_FILES ${IMGUI_BACKEND_SOURCES} ${imgui_SOURCE_DIR}/misc/freetype/imgui_freetype.cpp ${imgui_SOURCE_DIR}/misc/cpp/imgui_stdlib.cpp ${imgui_SOURCE_DIR}/misc/freetype/imgui_freetype.h ${imgui_SOURCE_DIR}/misc/cpp/imgui_stdlib.h)

file(COPY ${IMGUI_EXTRA_FILES} DESTINATION ${imgui_SOURCE_DIR})

FILE(GLOB IMGUI_SOURCES ${imgui_SOURCE_DIR}/*.cpp)
FILE(GLOB IMGUI_HEADERS ${imgui_SOURCE_DIR}/*.h)

message(STATUS "Selected ImGui sources: ${IMGUI_SOURCES}")
message(STATUS "Selected ImGui headers: ${IMGUI_HEADERS}")

add_library(${PROJECT_NAME} STATIC ${IMGUI_SOURCES} ${IMGUI_HEADERS})
add_library(${PROJECT_NAME}::${PROJECT_NAME} ALIAS ${PROJECT_NAME})

target_include_directories(${PROJECT_NAME} PRIVATE ${freetype_SOURCE_DIR}/include)
target_link_libraries(${PROJECT_NAME} PRIVATE freetype)
target_compile_definitions(${PROJECT_NAME} PRIVATE IMGUI_ENABLE_FREETYPE)

include(config/imgui_config.cmake)

foreach(file ${IMGUI_BACKEND_SOURCES})
    if(file MATCHES "\\.h$")
        list(APPEND filtered_list ${file})
    endif()
endforeach()
set(IMGUI_BACKEND_SOURCES ${filtered_list})

# copy ImGui headers to include dir
file(MAKE_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/imgui)
foreach (file ${IMGUI_HEADERS})
    get_filename_component(filename ${file} NAME)
    file(COPY_FILE ${file} ${CMAKE_CURRENT_SOURCE_DIR}/include/imgui/${filename})
endforeach()

foreach(file ${IMGUI_BACKEND_SOURCES})
    get_filename_component(filename ${file} NAME)
    file(COPY_FILE ${file} ${CMAKE_CURRENT_SOURCE_DIR}/include/imgui/${filename})
endforeach()

target_include_directories(${PROJECT_NAME} INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/include)
