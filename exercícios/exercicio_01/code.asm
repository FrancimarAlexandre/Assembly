# 1 – Escreva um algoritmo que calcule a divisão
# inteira e o resto da divisão de dois números.

.data 
 	quociente : .word 0
 	# mensagens 
 	dividendoText: .asciiz "digite o dividendo: "
 	
 	divisorText:.asciiz "digite o divisor: "
 	
 .text
 	# recebendo o dividendo e divisor do usuário
 	li $v0,4 # instrução para imprimir strig
 	
 	la $a0, dividendoText
 	 	
 	syscall
 	
 	li $v0,5 # leitura de inteiros
 	
 	syscall
 	
 	move $t1,$v0
 	
 	li $v0,4
 	
 	la $a0, divisorText
 	
 	syscall
 	
 	li $v0,5
 	
 	syscall
 	
 	move $t2,$v0
 	
 	div $t1,$t2
 	
 	
 	syscall
 	