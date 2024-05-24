# Travel App

Aplicativo iOS de viagens que consome as APIs GraphQL da Hurb.

## Interface

![inteface](Images/app.png)

## Features

- [x] Busca por Hotel
    - Com personalização da query string, data de entrada e saida, número de hóspedes.
- [x] Busca por Pacote
- [x] Lista dos resultados da API Search
- [x] Lista dos resultados da API Package
- [x] Lista dos resultados da API Hotel
- [x] Tela de loading
- [x] Tela de error
- [x] Sugestões de busca
    - Com buscas recentes. 
- [x] Tela de detalhes do Pacote
- [x] Tela de detalhes do Hotel
- [x] Compartilhamento de Hotéis e Pacates
- [x] Logs
- [x] Testes


## Estrutura do projeto e Arquitetura
O projeto foi desenvolvido na arquitetura MVVM e adotando alguns Design Patterns para melhorar a estrutura do projeto.  
"Camadas" do projeto:
- Network: Utilizei o HUNetwork disponibizado por vocês para fazer as chamadas a API GraphQL. Ele esta localizado em Modules/HUNetwork.
- Models: Entidades usadas na aplicação (SearchResult, HotelResult, PackageResult).
- Managers: Singletons de responsabilidade única usados no projeto. Só foi necessário criar um Manager para o controle dos dados de buscas recentes armazenados localmente (UserDefaultsManager).
- Utils: Todo arquivo com classes e funções que facilitam o desenvolvimento do projeto (Extensions, Constants, etc.).
- Resources: Assets e LaunchScreen.
- UIComponents: Encapsula todos os componentes visuais menores (não telas inteiras) do App. É um diretório com arquivos que utilizam apenas a biblioteca visual escolhida (SwiftUI), ou seja, não tem dependências externas.
- Scenes: Interface do usuário, usando MVVM. Essa camada cria todas as telas do App de maneira modularizada. Cada cena possui os seguintes arquivos:
    - Factory: Instancia todas os objetos da cena e injeta neles suas dependências.
    - Interactor: Responsável pelo resgate dos dados da API necessários para a cena e envio para o ViewModel.
    - Router: Responsável por todo o processo de navegação da cena.
    - ViewModel: Responsável por toda a lógica da cena.
    - View: Intreface visual feita em SwiftUI.
    - HostingController: Encapsula a View feita em SwiftUI para ser utilizada no contexto do UIKit.

<p align="center">
  <img src="Images/app_folders.png" height="350" title="">
</p>
