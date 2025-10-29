# Assembly MIPS
### Assembler -> compilador
### Assembly -> Linguagem de programação

## Conjunto de instruções MIPS

    - Instrução é uma palavra da linguagem
    - ISA MIPS
        - Instruções possuem até 3 operandos
        - ISA = Instruction Set Architecture

    - No MIPS, os operandos das intruções são registradores
    - Há 32 registradores de 32 bits, cada
    - Um registrador possui o símbolo $ antecedendo o seu nome
    - Load e Store
        - Load -> intrução de movimentação de dados de memória para o registrador
            - Operção de leitura da memória
        - Store -> instrução de movimentação de dados do registrador para a memória
            - Operação de escrita na memória
    - Move
        - instrução para passar o conteúdo de um registrador para outro registrador
            - Memória RAM não é envolvida
## MARS
    - Registraddores
        - $zero -> constante zero(0)
        - $at -> assember temporary
        - $v0,$v1 -> retornam resultados de funções
        - $a0,$a1,$a2,$a3 -> argumentos de funções
        - $ra -> return address(endereço de retorno de uma função)
        - $t1 a $t9 -> registradores temporários, que podem ser modificados por funções
        - $s1 a $s8 -> similares aos $t1 a $t9, mas salvam valores 
        - $k0 e $k1 -> registradores do kernel
        - $gp -> registrador de valores globais
        - $sp -> stack pointer(aponta pro inicio da stack e muda progressivamente)
        - $fp -> frame pointer(aponta pro inicio da pilha a não muda até que a função seja executada)
## COMANDOS LI $V0
    - li $v0,1 -> imprimir inteiro
    - li $v0,2 -> imprimir float
    - li $v0,3 -> imprimir double
    - li $v0,4 -> imprimir String ou char
    - li $v0,5 -> ler inteiro
    - li $v0,6 -> ler float
    - li $v0,7 -> ler double
    - li $v0,8 -> ler String ou char
    - li $v0,10 -> encerrar programa principal

## COMANDOS CONDICIONAIS
    - beq $t1,$t2,label -> Se $t1 for iqual a $t2, execute a partir do rótulo label
    - bne $t1,$t2,label -> Se $t1 for diferente de $t2, execute a partir do rótulo label
    - blt $t1,$t2,label -> Se $t1 for menor que $t2, execute a partir do rótulo label
    - bgt $t1,$t2,label -> Se $t1 for maior que $t2, execute a partir do rótulo label
    - ble $t1,$t2,label -> Se $t1 for menor ou iqual a $t2, execute a a partir do rótulo label
    - bge $t1,$t2,label -> Se $t1 for maior ou igual a $t2, execute a partir do rótulo label 
