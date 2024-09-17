# Lab de Sistemas Digitais - Semana 4

## 1 Introdução:
Segue o relatório do trabalho de laboratório realizado neste dia:

### Parte I:
Este exercício consiste em montar um contador incremental síncrono de 8 bits que incrementa a cada borda positiva de “clk”. O contador é incrementado se “enable” estiver habilitado. Os números que serão exibidos variam entre 00 e FF, o que representa 0 até 255. A criação deste contador foi realizada modularizando o “T Flip-Flop” e ligando 8 módulos com portas AND entre eles e a opção “clear” que limpa o contador.

<img src="/img1-1.png"> <br>
<img src="/img1-2.png"> <br>
<img src="/img1-3.png"> <br>

### Parte II:
O exercício em questão requer que se construa um contador a partir da ideia de sempre somar um, guardando o resultado em um registrador, para posteriormente, efetuar mais somas e, por conseguinte, de um em um, o número em binário subir. Ele mostra números de 0 a F em cada um dos quatro displays hexadecimais. Os números vão de 0 a 65535. O clock e o reset estão associados aos botões Button[0] e Button[1], a fim de facilitar o uso do contador, o qual depende que o botão seja clicado para acrescentar em 1. Para implementar esse circuito, foi necessário um Adder para 16-bits e um  Registrador para esses 16-bits, com Enable e Clear, como é possível verificar no próprio RTL Viewer.  Sendo assim, em cada somador de 1 bit para o Adder de 16-bits, como a implementação pode ser por Half-Adders, o mínimo é que sejam 1 XOR e 1 AND para cada um, resultando, então, em 32 portas para realizar a soma. Agora, para o registrador, como foram feitos por Flip-Flops D, os quais são formados por 4 portas NOR/NAND, o mínimo de portas lógicas é 64. Frente a esses fatos, para fazer o contador, desconsiderando as portas lógicas do display hexadecimal, foram imprescindíveis 96 portas lógicas para a construção do circuito.

<img src="/img2-1.png">

### Parte III:
O exercício em questão requer que se construa dois contadores, um contador que regule o clock para que, a cada segundo, o outro contador some 1 e seja mostrado no display hexadecimal. O contador de clock faz somas até encontrar um número próximo de 50 milhões, já que como a placa tem o clock aproximado de 50MHz, as operações ocorreriam a cada 1 segundo. Assim, a cada um segundo, o contador vai subindo de 0 a 9 em forma de ciclo.

<img src="/img3-1.png">

### Parte IV:
O exercício em questão requer que se construa um contador, que regule o clock para que, a cada segundo, a palavra tenha a ordem trocada, seguindo a mesma lógica da parte 3 . O contador de clock faz somas até encontrar um número próximo de 50 milhões, já que como a placa tem o clock aproximado de 50MHz, as operações ocorreriam a cada 1 segundo. Assim, a ordem troca de dE0, para E0d, para 0dE, num ciclo.

<img src="/img4-1.png">

### Parte V:
O exercício em questão requer que se construa um contador, que regule o clock para que, a cada segundo, a palavra seja shiftada nos displays da placa, seguindo a mesma lógica da parte 3 e 4. O contador de clock faz somas até encontrar um número próximo de 50 milhões, já que como a placa tem o clock aproximado de 50MHz, as operações ocorreriam a cada 1 segundo. - - - d E 0, para - - d E 0 -, para - d E 0 - -, para d E 0 - - -, para E 0 - - - d, para 0 - - - d E, para - - - d E 0, num ciclo.

<img src="/img5-1.png">
