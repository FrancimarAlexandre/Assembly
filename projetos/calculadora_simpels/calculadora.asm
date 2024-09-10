.data 
	numero_1: .asciiz "Digite o primeiro número: "
	numero_2: .asciiz "Digite o segundo número: "
	opcao: .asciiz "escolha uma operação:\n1)adição\n2)subtração\n3)multiplicação\n4) divisão\n"
	resultado: .asciiz "Resultado: "
.text
	# exibindo a mensagem
	li $v0,4
	la $a0,numero_1
	syscall
	# lendo o primeiro número
	li $v0, 5
	syscall 
	
	move $t0,$v0 # movendo o valor para $t0
	# exibindo a mensagem
	li $v0,4
	la $a0, numero_2
	syscall
	# lendo o segundo número
	li $v0,5
	syscall 
	
	move $t1,$v0 # movendo o valor para $t1
	# exibindo mensagem
	li $v0,4
	la $a0,opcao
	syscall 
	# lendo a opção escolhida
	li $v0, 5
	syscall
	
	move $t3,$v0
	
	beq $t3,1,soma
	
	soma:
		# exibe a mensagem resultado
		li $v0,4
		la $a0,resultado
		syscall
		
		
		add $s0,$t0,$t1 # faz a soma
		# exibe o resultado da soma
		li $v0,1 
		move $a0,$s0

		syscall
		
		li $v0,10 # finaliza o programa
		
		syscall   
		
		
		
	
	