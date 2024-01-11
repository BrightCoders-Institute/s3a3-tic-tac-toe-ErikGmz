
![BrightCoders Logo](img/logo.png)

# Tic-Tac-Toe

## 📓 Descripción
Programa para simular partidas con el juego Tic-Tac-Toe.

## 📋 Tabla de contenido
- Tecnologías.
- Cómo instalar y ejecutar el proyecto.
- Cómo ejecutar las pruebas del proyecto.
- Cómo ejecutar RuboCop en el proyecto.
- Cómo ejecutar Reek en el proyecto.
- Cómo ejecutar RubyCritic en el proyecto.
- Créditos.
- Badges.

## 🔧 Tecnologías
- Ruby.
- Minitest.
- RuboCop.
- Reek.
- RubyCritic.

## ⚙️ Cómo instalar y ejecutar el proyecto
>_**1.** Verificar que Ruby se encuentre instalado en el sistema._
>```
>$ ruby -v
>   ruby 3.2.2-1 (set by C:\Ruby-on-Windows\global.txt)
>```
>
>_**2.** Clonar o descargar el repositorio._
>```
>$ git clone https://github.com/BrightCoders-Institute/s3a3-tic-tac-toe-ErikGmz.git
>```
>
>_**3.** Desplazarse al directorio del proyecto._
>```
>$ cd <ruta_directorio>
>```
>
>_**4.** Ejecutar el archivo "main.rb" desde una terminal de comandos._
>```
>$ ruby .\src\main.rb
>
>   ||-----------------Juego Tic-Tac-Toe-----------------||
>   ||                                                   ||
>   || Ficha del primer jugador  ---> X (actual)         ||
>   || Ficha del segundo jugador ---> O                  ||
>   ||                                                   ||
>   ||---------------------------------------------------||
>   ||                                                   ||
>   ||       1     2     3                               ||
>   ||                                                   ||
>   ||          |     |                                  ||
>   ||  1    X  |  X  |  O                               ||
>   ||          |     |                                  ||
>   ||     -----------------                             ||
>   ||          |     |                                  ||
>   ||  2    O  |  X  |  X                               ||
>   ||          |     |                                  ||
>   ||     -----------------                             ||
>   ||          |     |                                  ||
>   ||  3    X  |  O  |  O                               ||
>   ||          |     |                                  ||
>   ||                                                   ||
>   ||---------------------------------------------------||
>   
>   La partida ha finalizado en empate.
>```

## 🔬 Cómo ejecutar las pruebas del proyecto
>_**1.** Instalar las gemas de Minitest y ffi._
>```
>$ gem install minitest
>   Successfully installed minitest-5.20.0
>   Parsing documentation for minitest-5.20.0
>   Couldn't find file to include 'README.rdoc' from lib/minitest.rb
>   Done installing documentation for minitest after 2 seconds
>   1 gem installed
>
> $ gem install ffi
>   Successfully installed ffi-1.16.3-x64-mingw-ucrt
>   Parsing documentation for ffi-1.16.3-x64-mingw-ucrt
>   Done installing documentation for ffi after 1 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar directamente desde el directorio del proyecto el archivo con las pruebas unitarias._
>```
>$ ruby .\test\board_test.rb
>   Run options: --seed 6543
>   
>   # Running:
>   
>   ...
>   
>   Finished in 0.031870s, 94.1318 runs/s, 2196.4092 assertions/s.
>   
>   3 runs, 70 assertions, 0 failures, 0 errors, 0 skips
>```

## 🔍 Cómo ejecutar RuboCop en el proyecto
>_**1.** Instalar la gema de RuboCop._
>```
>$ gem install rubocop
>   rbenv: Rehash executable 'rubocop' for gem 'rubocop'
>   Successfully installed rubocop-1.59.0
>   Parsing documentation for rubocop-1.59.0
>   Done installing documentation for rubocop after 14 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar RuboCop en el directorio del proyecto._
>```
>$ rubocop
>   Inspecting 13 files
>   .......................
>   
>   13 files inspected, no offenses detected
>
>$ rubocop -L
>   Gemfile
>   src/board/board.rb
>   src/board/board_printing.rb
>   src/board_tokens/hollow_circle_token.rb
>   src/board_tokens/token.rb
>   src/board_tokens/x_cross_token.rb
>   src/main.rb
>   src/results/results.rb
>   src/results/tie_results.rb
>   src/tic_tac_toe/tic_tac_toe_game.rb
>   test/board_generation.rb
>   test/board_test.rb
>   test/tic_tac_toe_test.rb
>```

## 🧩 Cómo ejecutar Reek en el proyecto
>_**1.** Instalar la gema de Reek._
>```
>$ gem install reek
>   rbenv: Rehash executable 'code_climate_reek' for gem 'reek'
>   rbenv: Rehash executable 'reek' for gem 'reek'
>   Successfully installed reek-6.2.0
>   Parsing documentation for reek-6.2.0
>   Done installing documentation for reek after 4 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar Reek en el directorio de la aplicación._
>```
>$ cd .\src\ 
>$ reek
>   Inspecting 9 file(s):
>   SS......S
>   ...
>```
>
>_**3.** Ejecutar Reek en el directorio de las pruebas._
>```
>$ cd .\test\ 
>$ reek
>   Inspecting 3 file(s):
>   SSS
>   ...
>```

## 🛠️ Cómo ejecutar RubyCritic en el proyecto
>_**1.** Instalar la gema de RubyCritic._
>```
>$ gem install rubycritic
>   rbenv: Rehash executable 'rubycritic' for gem 'rubycritic'
>   Successfully installed rubycritic-4.9.0
>   Parsing documentation for rubycritic-4.9.0
>   Done installing documentation for rubycritic after 3 seconds
>   1 gem installed
>```
>
>_**2.** Ejecutar RubyCritic en el directorio de la aplicación._
>```
>$ cd .\src\ 
>$ rubycritic
>   running flay smells
>   
>   running flog smells
>   .........
>   running reek smells
>   .........
>   running complexity
>   .........
>   running attributes
>   .........
>   running churn
>   .........
>   running simple_cov
>   .........
>   New critique at file:///C:/Users/erikg/Desktop/s3a3-tic-tac-toe-
>   ErikGmz/src/tmp/rubycritic/overview.html
>   Score: 94.02
>```
>
>_**3.** Ejecutar RubyCritic en el directorio de las pruebas._
>```
>$ cd .\test\ 
>$ rubycritic
>   running flay smells
>   .
>   running flog smells
>   ...
>   running reek smells
>   ...
>   running complexity
>   ...
>   running attributes
>   ...
>   running churn
>   ...
>   running simple_cov
>   ...
>   New critique at file:///C:/Users/erikg/Desktop/s3a3-tic-tac-toe-
>   ErikGmz/test/tmp/rubycritic/overview.html
>   Score: 83.46
>```

## 🕹️ Créditos
- **[ErikGmz](https://github.com/ErikGmz)**

## 💻 Badges
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![Visual Studio Code](https://img.shields.io/badge/Visual%20Studio%20Code-0078d7.svg?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Ruby](https://img.shields.io/badge/ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
