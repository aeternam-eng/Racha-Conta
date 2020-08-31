# Racha Conta

1º aplicativo desenvolvido para as aulas de LDDM do curso de Engenharia de Computação

## Documentação

O aplicativo consiste de uma única tela, na qual é possível determinar o valor total da conta, o número de pagantes da conta e a porcentagem da gorjeta a ser paga ao garçom.
Ao alterar qualquer um dos valores, o valor individual e o valor a ser pago ao garçom são alterados de acordo. Isso acontece por uso de uma arquitetura BloC Pattern através de streams que armazena os valores em um escopo diferente da visualização, fazendo com que os componentes sejam redesenhados de forma mais eficiente, e em tempo real. Os widgets que utilizam os valores utilizam um StreamBuilder, para usufruir das streams providas pelo BloC.

## Estrutura
1. main.dart (Inicializa o app);
2. app.dart (Define e configura o MaterialApp, chama a Home Page);
3. pages
  * Home Page (Chama a página de overview);
  * Overview Page (Tela principal do aplicativo);
4. widgets
  * Number Picker Tile (Item do layout que lida com a entrada do número de pagantes);
  * Number Tile (Item do layout que lida com a entrada e exibição de valores numéricos);
  * Percentage Tile (Item do layout que lida com a entrada de valores percentuais);
5. blocs
  * Overview Bloc (Gerencia as regras de negócio da página de overview, através das streams de cada valor do aplicativo.)
