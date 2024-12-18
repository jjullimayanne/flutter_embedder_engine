cmake_minimum_required(VERSION 3.10)
project(flutter_car)

# Encontrar GLFW
find_package(glfw3 REQUIRED)

# Adicionar o diretório de include
include_directories(${CMAKE_SOURCE_DIR}/embedder)

# Criar o executável
add_executable(car_dashboard embedder/FlutterEmbedderGLFW.cc)

# Linkar as bibliotecas necessárias no macOS
if (APPLE)
    target_link_libraries(car_dashboard glfw "-framework OpenGL" "-framework Cocoa" "-framework IOKit" "-framework CoreVideo")
else()
    target_link_libraries(car_dashboard glfw GL)
endif()

# Definir o diretório de saída
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build)
