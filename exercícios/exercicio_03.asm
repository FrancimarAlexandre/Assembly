# 3 – Escreva um procedimento recursivo que
# calcule a exponencial de um número.
.data 
	# mensagens
	msmBase: .asciiz "Digite a base: "
	msmExpoente: .asciiz "Digite o Expoente: "
	msmResultado: .asciiz "Resultado: "
.text
.globl main:
	# Função principal
	main:
		# lendo o valor da base
		li $v0,4
		la $a0,msmBase
		syscall
		
		li $v0,5
		syscall
		move $t0,$v0 # base $t0
		
		# lendo o expoente
		li $v0,4
		la $v0,msmExpoente
		syscall
		
		li $v0,5
		syscall
		move $t1,$v0 # expoente $t1
		
	power:
	
		
