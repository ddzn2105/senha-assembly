Comando nasm para rodar o programa: 

  nasm -f elf64 main.asm -o main.o
  nasm -f elf64 io.asm -o io.o
  ld -o programa main.o io.o
  ./programa


O programa é dividido em dois arquivos principais:

  1- main.asm: Contém o fluxo principal do programa.
  2- io.asm: Contém as funções de entrada, saída e comparação.
  
  main.asm - Código Principal
    Este arquivo gerencia a solicitação e leitura das senhas, além de chamar as funções externas para comparar e exibir mensagens.
  
  io.asm - Funções de Entrada, Saída e Comparação
    Este arquivo contém as funções auxiliares usadas pelo código principal para leitura, escrita e comparação de strings.


Funções dos blocos no programa:

  Bloco 1 e Bloco 3: Exibe mensagens solicitando a senha.
  Bloco 2 e Bloco 4: Lê as senhas do teclado.
  Bloco 5: Compara as duas senhas lidas.
  Bloco 6 e Bloco 7: Exibe mensagens de sucesso ou erro com base no resultado da comparação.


Resultados de saída do programa:

  Caso 1 - As senhas digitadas são diferentes:
      Compara as senhas caracter por caracter e se forem diferentes, imprime: senhas nao coincidem.
      
  Caso 2 - As senhas digitadas são iguais:
      Compara as senhas caracter por caracter e se forem iguais, imprime: senha alterada com sucesso.


Funções usadas no programa:

  le: le uma string do teclado

  escreve: imprime uma string no teclado

  compara: faz um loop que compara duas strings caracter por caracter, se forem diferentes, para a comparação e da um jump para o bloco: compara_diferente e retorna 1.
  Se forem iguais, continua a comparação até acabar a string e se no final continuarem iguais, o programa retorna 0.
