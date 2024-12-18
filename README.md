## 🚗 Flutter Embedder Engine + GLFW: Painel Automotivo Digital

### Este projeto demonstra como usar o **Flutter Embedder Engine** em um ambiente **GLFW** para criar um **Painel Automotivo Digital** em um **sistema embarcado**.
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

O projeto é composto por:

## 1. O Flutter Engine:
O Flutter Engine é o coração do Flutter. Ele é responsável por:

- Renderizar a interface gráfica: Utiliza o motor de renderização Skia para desenhar os widgets na tela com alta performance.
  
- Executar o código Dart: O código escrito em Dart é compilado em bytecode que roda dentro da Dart Virtual Machine (VM).
  
- Gerenciar texturas, fontes e eventos: Carrega texturas, gerencia fontes e processa eventos como toques, cliques e entradas de teclado.

Por que o Flutter Engine é importante?

- Ele fornece uma abstração que separa a lógica Dart do sistema nativo.
Pode rodar em diferentes hosts, como Android, iOS, web, sistemas embarcados e desktops.

## 2. O Host Embedder 
O Host Embedder é o "conector" entre o Flutter Engine e o sistema operacional, geralmente escrito em C++.

Função Principal:
- Inicializar o Flutter Engine: Carrega o motor do Flutter na memória e prepara o ambiente para execução.
  
- Configurar o loop de eventos: Captura os eventos do GLFW (teclado, mouse) e os redireciona para o Flutter Engine.
  
Carregar recursos:

- A pasta flutter_assets, gerada pelo comando flutter build bundle, contém todos os assets necessários (texturas, fontes, código Dart compilado).
  
- Gerenciar renderização: Atualiza a tela constantemente, garantindo que o Flutter Engine desenhe os widgets corretamente.

## 3. GLFW
GLFW é uma biblioteca de código aberto em C que facilita o gerenciamento de janelas e eventos gráficos.

O que ele faz:

- Cria uma janela de renderização para desenhar o conteúdo do Flutter Engine.
Captura eventos de entrada, como teclado e mouse, e os repassa para o Flutter Engine.

- Gerencia o contexto OpenGL, essencial para renderizar gráficos em tempo real.
  
Por que usar GLFW?

- É leve e ideal para aplicações embarcadas e de baixo desempenho.
  
- Integra bem com aplicações C++.
  
- Suporta várias plataformas (Windows, macOS, Linux).

##🔧 Fluxo de Funcionamento

1 - O Host Embedder é escrito em C++ e faz o seguinte:

- Cria uma janela usando GLFW.
- Carrega o Flutter Engine e configura a execução.
- Processa eventos e repassa para o Flutter Engine.
  
2 - O Flutter Engine:

- Renderiza os widgets usando o motor Skia.
- Gerencia a lógica do aplicativo em Dart.
- Processa eventos de entrada (toques, teclas) recebidos do GLFW.
  
3 - O GLFW:

- Gera uma janela de exibição e repassa os eventos de entrada para o Host Embedder


## 🔧 Pré-Requisitos
Certifique-se de ter os seguintes componentes instalados:

1. Instalar o CMake e o GLFW
macOS/Linux:
Utilize o Homebrew para instalar as dependências:

~~~javascript
# Instale o CMake
brew install cmake

# Instale o GLFW
brew install glfw

~~~

##  🛠️ Configuração e Build

### 1. Configurar a Aplicação Flutter
Entre na pasta car_app e instale as dependências do Flutter:
~~~javascript
cd car_app
flutter pub get
~~~

Gere os assets necessários para o Flutter Embedder Engine:

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

#### Por que isso é necessário?

O Flutter Engine não executa o projeto diretamente. Ele precisa dos arquivos compilados e organizados na pasta flutter_assets.

### 2. Build do Host Embedder (C++)

Gere os arquivos do CMake:

~~~
cmake -B build
~~~

Compile o projeto:
~~~
make -C build
~~~
Execute o projeto:
~~~
make -C build
~~~



## 🚀 Geração Manual do Flutter Engine
📌 Por que gerar o Flutter Engine manualmente?
A Flutter Engine é o núcleo que renderiza o conteúdo Flutter e gerencia a comunicação entre Dart e o sistema nativo. Quando desenvolvemos um projeto que utiliza Flutter Embedder em um ambiente customizado (como GLFW para sistemas embarcados), nem sempre os binários oficiais do Engine estão disponíveis para download.

1 - Ambientes Não Suportados Nativamente
O Flutter SDK fornece binários pré-compilados para as plataformas mais comuns (como Android, iOS, macOS, Windows e Web).
- No entanto, se você está trabalhando com um host customizado em C++ e usando GLFW, esses binários prontos podem não ser compatíveis.
  
- Gerar a Flutter Engine manualmente permite que você ajuste a engine para funcionar em qualquer plataforma ou ambiente desejado.

2 - Controle Total sobre o Build
Ao gerar a Flutter Engine manualmente, você tem controle total sobre:
- Otimizações de build: Ajustar o desempenho da Engine para o hardware alvo.
  
- Tamanho do binário: Remover funcionalidades desnecessárias para reduzir o tamanho da aplicação.
  
- Customizações de plataforma: Adicionar suporte a drivers de hardware específicos ou integrar com bibliotecas de terceiros.

4 - Suporte a Arquiteturas Específicas
- Para sistemas embarcados ou painéis automotivos, você pode estar lidando com arquiteturas como ARM (ex: Raspberry Pi) ou processadores customizados.
  
- Compilar a Flutter Engine manualmente garante que ela será otimizada e compatível com a arquitetura do hardware específico.

4 - Uso de Flutter com Hosts Customizados (como GLFW)
- O Host Embedder em C++ é responsável por conectar a Flutter Engine com o ambiente de execução (GLFW neste caso).
  
- A geração manual da Engine possibilita:
    - Configurar corretamente o embedder para rodar os `flutter_assets`.
      
    - Adaptar a Engine para capturar eventos de entrada e gerar saídas em um sistema customizado.

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
