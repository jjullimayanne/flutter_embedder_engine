#include <GLFW/glfw3.h>
#include <flutter_embedder.h>
#include <iostream>
#include <string>

const std::string kFlutterAssetsPath = "flutter_assets";
const std::string kICUDataPath = "/path/to/icudtl.dat";          // Caminho para o ICU Data
const std::string kAotLibPath = "/path/to/libflutter_engine.so"; // Caminho para a engine Flutter compilada

int main()
{

    if (!glfwInit())
    {
        std::cerr << "Erro ao inicializar GLFW" << std::endl;
        return -1;
    }

    GLFWwindow *window = glfwCreateWindow(800, 600, "Flutter Dashboard", NULL, NULL);
    if (!window)
    {
        std::cerr << "Erro ao criar janela GLFW" << std::endl;
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);

    FlutterEngine engine;
    FlutterEngineResult result;

    FlutterRendererConfig config = {};
    config.type = kOpenGL;
    config.open_gl.struct_size = sizeof(FlutterOpenGLRendererConfig);

    FlutterProjectArgs args = {};
    args.struct_size = sizeof(FlutterProjectArgs);
    args.assets_path = kFlutterAssetsPath.c_str();
    args.icu_data_path = kICUDataPath.c_str();

    result = FlutterEngineInitialize(
        FLUTTER_ENGINE_VERSION, &config, &args, nullptr, &engine);
    if (result != kSuccess)
    {
        std::cerr << "Erro ao inicializar Flutter Engine" << std::endl;
        return -1;
    }

    while (!glfwWindowShouldClose(window))
    {
        glfwPollEvents();
        FlutterEngineRunTask(engine, nullptr); 
        
    }

    FlutterEngineShutdown(engine);

    glfwDestroyWindow(window);
    glfwTerminate();

    return 0;
}
