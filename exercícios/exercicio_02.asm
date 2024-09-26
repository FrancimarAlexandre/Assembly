# 2 – Depois de desenvolver o algoritmo que
# calcula o resto de uma divisão, utilize-o como
# procedimento para um programa que verifica se
# um número é par ou ímpar.

.data
	msmpar: .asciiz "Par\n"
	msmimpar: .asciiz "Impar\n"
	dividendoText: .asciiz "digite o dividendo: "
.text
	# coletando o divendo
	li $v0,4
	la $a0,dividendoText
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0 # valor do dividendo
	
	# atribuindo o valor 2 
	addi $t1,$zero,2
	resto_divisao:
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
		beq $t2,0,Par
		beq $t2,1,Impar
	Par:
		li $v0,4
		la $a0,msmpar
		syscall
		
		li $v0,10
		syscall
	Impar:
		li $v0,4
		la $a0,msmimpar
		syscall
		
		li $v0,10
		syscall