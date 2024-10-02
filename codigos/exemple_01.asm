# f = (g + h) - (i + j)
.data 
	_g: .word 7
	_h: .word 58
	_i: .word 4
	_j: .word 25
	
.text
# carregando os valores da memória para registradores
	lw $t0,_g
	lw $t1,_h
	
	lw $t2,_i
	lw $t3,_j
	# somando g com h
	add $s0,$t0,$t1

	# somando i com j
	add $s1,$t2,$t3
	# fazendo a subtração
	sub $t4,$s0,$s1
	# movendo o valor final para o registrador $a0
	move $a0,$t4
	
	# chamando a syscall para imprimir o valor
	li $v0, 1  # Sinaliza a syscall de impressão de inteiro
	syscall    # Executa a impressão
	
	sair:
		li $v0,10
		syscall
	