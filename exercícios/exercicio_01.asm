# 1 – Escreva um algoritmo que calcule a divisão
# inteira e o resto da divisão de dois números.

.data 
 	# mensagens 
 	dividendoText: .asciiz "digite o dividendo: "
 	divisorText:.asciiz "digite o divisor: "
 	
 	msmQuociente: .asciiz "Quociente = "
 	msmResto: .asciiz"Resto = "
 	
 	quebralinha: .asciiz "\n"
 	
 	
 .text
 	# recebendo o dividendo
 	
 	li $v0,4 # instrução para imprimir uma string
 	la $a0,dividendoText
 	syscall
 	
 	# lendo o valor do dividendo
 	
 	li $v0,5
 	syscall
 	move $t0,$v0 # movendo o valor de $v0 para o registrador $t0
 	
 	
 	# reccebendo o divisor
 	
 	li $v0,4
 	la $a0,divisorText
 	syscall
 	
 	# lendo o valor do divisor
 	li $v0,5
 	syscall
 	move $t1,$v0 # movendo o valor de $v0 para o registrador $t1
	
	
	# quociente e resto
	
	move $t2,$t0 # resto
	move $t3,$zero # quociente
	
	# Laço while
	while:
		bge $t2,$t1,CalcularDivisor
		j exibir
	# Função para calcular o divisor
	CalcularDivisor:
		sub $t2,$t2,$t1
		addi $t3,$t3,1
		j while
	
	exibir:
		# exibindo os dados
		
		# QUOCIENTE
		li $v0,4
		la $a0,msmQuociente
		syscall
		
		li $v0,1
		move $a0,$t3
		syscall
		
		# quebra de linha
		li $v0,4
		la $a0,quebralinha
		syscall
		
		# RESTO
		li $v0,4
		la $a0,msmResto
		syscall
		
		li $v0,1
		move $a0,$t2
		syscall
		li $v0,10
		syscall
	