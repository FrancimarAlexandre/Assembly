# 2.3 [5] <§§2.2, 2.3> Para a instrução C a seguir, qual é o código assembly do
# MIPS correspondente? Suponha que as variáveis f, g, h, i e j sejam
# atribuídas aos registradores $s0, $s1, $s2, $s3 e $s4, respectivamente.
# Suponha que o endereço de base dos arrays A e B estejam nos registradores
# $s6 e $s7, respectivamente.
# B[ 8 ] =  A[ i - j ]
.data
	# Definindo os arrays e seus valores
	A: .word 1,2,3,4,5,6,7,8,9,10
	B: .word 7,8,32,9,4,7,1,12,5,78
	# definindo os valores de i e j
	_i: .word 5
	_j: .word 5
	# mensagens
	_msmVetorA: .asciiz "Vetor A: "
	_msmVetorB: .asciiz "\nVetor B: "

.text
	# passando a posição de B[8]
	li $t2,32 # 4 x 8 = 32
	# carregando os valores de i e j da memória
	lw $s3,_i
	lw $s4,_j
	# subtração (i-j)
	sub $t0,$s3,$s4
	
	# acessando o array na possição $t0
	lw $s6,A($t0)
	
	# movendo o valor de A($t0) para o registrador $t1
	
	move $t1,$s6
	
	# mandando para a memória o valor 
	
	sw $t1,B($t2)
	
	# imprimindo as mensagens (array A)
	li $v0,4
	la $a0,_msmVetorA
	syscall
	# atribuindo novos valores aos registradores
	move $t0,$zero # indice do array
	li $t2,40 # tamanho do array
	imprimirA:
		beq $t0,$t2,imprimirB
			
		li $v0,1
		lw $a0,A($t0)
		syscall
		addi $t0,$t0,4
			
		j imprimirA
	imprimirB:
		# imprimindo as mensagens (array A)
		li $v0,4
		la $a0,_msmVetorB
		syscall
		# atribuindo novos valores aos registradores
		move $t0,$zero # indice do array
		li $t2,40 # tamanho do array
		loop:
			beq $t0,$t2,final
			
			li $v0,1
			lw $a0,B($t0)
			syscall
			addi $t0,$t0,4
			
			j loop
	
	final:
		li $v0,10
		syscall
	
	