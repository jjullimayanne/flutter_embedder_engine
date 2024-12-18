## 🚗 Flutter Embedder Engine + GLFW: Painel Automotivo Digital

Este projeto demonstra como usar o **Flutter Embedder Engine** em um ambiente **GLFW** para criar um **Painel Automotivo Digital** em um **sistema embarcado**.
---
## 📋 **Descrição do Projeto**

- **Objetivo**: Renderizar uma aplicação Flutter em um sistema personalizado utilizando o Flutter Engine Embedder.
- **Host**: GLFW (gerenciador de janelas leve).
- **Funcionalidades**:
  - Velocidade do carro (simulada em tempo real).
  - Nível de combustível.
  - Alertas (porta aberta, tanque vazio).
  - Controles de mídia (play, pause, próxima música).

---
## 🚀 **Tecnologias Utilizadas**

- **Flutter Embedder Engine**: Renderiza a aplicação Flutter.
- **GLFW**: Biblioteca C++ para janelas e gráficos.
- **CMake**: Ferramenta para compilar o projeto C++.
- **Isolates**: Processamento em background no Dart.
- **C++**: Host para rodar o Flutter Engine.

---
## 🔧 Papel do C++ e Flutter Embedder Engine
Aqui está o passo a passo detalhado de como o C++ é usado para integrar o Flutter com GLFW:

## 1. O Flutter Engine é Escrito em C++
O Flutter Engine é o motor principal do Flutter. Ele é responsável por:

- Desenhar a interface do usuário usando o motor de renderização Skia.
  
- Gerenciar a lógica do aplicativo escrita em Dart.
  
- Processar eventos como toques, teclas, etc.
  
Esse motor é implementado em C++ para garantir desempenho máximo e ser compatível com várias plataformas.

## 2. O Host Embedder é Escrito em C++
O "host embedder" é o código C++ que inicializa o Flutter Engine e o conecta a um gerenciador de janelas, como GLFW.

### O que o Embedder faz?
- Inicializa o Flutter Engine.
- Carrega os assets (arquivos gerados pelo Flutter: flutter_assets).
- Configura o loop de eventos para capturar e processar entrada do usuário (ex.: toques, teclas).
- Gera uma janela usando GLFW ou outra biblioteca gráfica.
- Atualiza a tela chamando o método de renderização do Flutter Engine.

## ⚙️ **Pré-Requisitos**

Antes de rodar o projeto, instale as seguintes dependências:

## Por que Precisamos do Compilador C++?
O compilador C++ é necessário porque:

- Código do Flutter Embedder é escrito em C++.

Precisamos compilar o código C++ para um executável.
- O Flutter Engine é distribuído como bibliotecas pré-compiladas (ex.: libflutter_engine.so para Linux).

O compilador C++ vincula o código do host (embedder) com a biblioteca do Flutter Engine.
- Integração com GLFW:

GLFW é uma biblioteca gráfica nativa (escrita em C/C++), então precisamos de um compilador C++ para integrá-la ao projeto.

### **1. Instale o GLFW e CMake**
Por que Precisamos do Compilador C++?
O compilador C++ é necessário porque:

Código do Flutter Embedder é escrito em C++.

Precisamos compilar o código C++ para um executável.
O Flutter Engine é distribuído como bibliotecas pré-compiladas (ex.: libflutter_engine.so para Linux).

O compilador C++ vincula o código do host (embedder) com a biblioteca do Flutter Engine.
Integração com GLFW:

GLFW é uma biblioteca gráfica nativa (escrita em C/C++), então precisamos de um compilador C++ para integrá-la ao projeto.

1. Flutter SDK:
Instale o Flutter seguindo as instruções oficiais.

2. GLFW (gerenciador de janelas leve):

macOS/Linux:
~~~javascript
brew install glfw
~~~

3. CMake:
~~~javascript
brew install cmake
~~~

### 🛠️ Configuração do Ambiente
1. Configurar a Aplicação Flutter
Entre na pasta car_app e instale as dependências do Flutter:
~~~javascript
cd car_app
flutter pub get
~~~

2. Gere os assets necessários para o Flutter Embedder Engine:

~~~javascript
flutter build bundle --asset-dir=flutter_assets
~~~


Após executar o comando, o Flutter cria a pasta flutter_assets com os seguintes arquivos:

~~~javascript
flutter_assets/
├── kernel_blob.bin               # Código Dart compilado (Kernel)
├── vm_snapshot_data              # Dados do snapshot do Virtual Machine do Dart
├── isolate_snapshot_data         # Snapshot do isolate principal
├── FontManifest.json             # Configuração das fontes
├── AssetManifest.json            # Manifesto dos assets (ex.: imagens)
├── NOTICES                       # Licenças
└── packages/                     # Pacotes e dependências necessários
~~~

### 🛠️ Por que é Necessário?
- O Flutter Embedder Engine não executa um projeto Flutter diretamente. Ele precisa dos arquivos pré-compilados.
  
- O comando flutter build bundle compila o código Dart e organiza todos os recursos necessários em um formato que o Flutter Engine pode ler.
  
- A pasta flutter_assets é essencial porque:
Contém o kernel_blob.bin que é o código Dart compilado.
Inclui snapshots e assets usados pelo Flutter Engine (texturas, fontes, imagens, etc.).

Esses três comandos são usados para gerar, compilar e executar o projeto C++ com CMake e Make, criando automaticamente a pasta de build para organizar os arquivos de compilação.

~~~javascript
# Gera os arquivos do CMake e cria a pasta build automaticamente
cmake -B build

# Compila o projeto dentro da pasta build
make -C build

# Executa o projeto
./build/car_dashboard
~~~

Esses comandos são necessários porque estamos trabalhando com um projeto Flutter Embedder Engine que utiliza C++ como linguagem para criar um host customizado. Aqui está uma explicação detalhada sobre o que cada comando faz e por que eles são importantes:

🔍 Resumo: Por que precisamos desses passos?
- CMake:

Gera os arquivos de configuração necessários para a compilação do código C++.
Organiza o build em uma pasta específica (build).
- Make:

Compila o código C++ em um executável que o sistema operacional pode rodar.
- Executar o projeto:

Carrega o Flutter Engine e renderiza a aplicação Flutter customizada na janela GLFW.

## 🚀 Geração Manual do Flutter Engine
📌 Por que gerar o Flutter Engine manualmente?
A Flutter Engine é o núcleo que renderiza o conteúdo Flutter e gerencia a comunicação entre Dart e o sistema nativo. Quando desenvolvemos um projeto que utiliza Flutter Embedder em um ambiente customizado (como GLFW para sistemas embarcados), nem sempre os binários oficiais do Engine estão disponíveis para download.

Portanto, precisamos compilar a Flutter Engine manualmente para garantir que:

A versão correta do Flutter Engine esteja disponível.
Podemos rodar o projeto em ambientes personalizados como dispositivos embarcados, sistemas automotivos, ou plataformas não oficialmente suportadas.

## 🛠️ Como gerar a Flutter Engine manualmente
Siga os passos abaixo para gerar e compilar a Flutter Engine:

Clone o repositório do Flutter Engine:

~~~javascript
git clone https://github.com/flutter/engine.git
cd engine

~~~
Faça checkout no commit específico que você deseja compilar:


~~~javascript
git checkout <SHA_DO_COMMIT>


~~~

Instale o depot_tools (ferramentas necessárias para o build):
~~~javascript
git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git
export PATH="$PATH:/path/to/depot_tools"

~~~

Configure o gclient para sincronizar as dependências:

~~~javascript
gclient config --unmanaged https://github.com/flutter/engine.git
gclient sync

~~~
Configure o build com gn:


~~~javascript
./flutter/tools/gn --runtime-mode=release --unoptimized

~~~

Compile a Flutter Engine com ninja:

~~~javascript
ninja -C out/host_release

~~~
