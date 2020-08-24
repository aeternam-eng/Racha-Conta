# Racha Conta

1º aplicativo desenvolvido para as aulas de LDDM do curso de Engenharia de Computação

## Documentação

O aplicativo consiste de uma única tela, na qual é possível determinar o valor total da conta, o número de pagantes da conta e a porcentagem da gorjeta a ser paga ao garçom.
Ao alterar qualquer um dos valores, o valor individual e o valor a ser pago ao garçom são alterados de acordo. Isso acontece por uso de uma arquitetura BloC através de streams(arquitetura recomendada para o Flutter), que armazena os valores em um escopo diferente da visualização, fazendo com que os componentes sejam redesenhados de forma mais eficiente, e em tempo real.
