# somando três números
.data
	_a: .word 7
	_b: .word 9
	_c: .word 10
	
.text
	# carregando os valores da memória para registradores
	lw $t0, _a  # Carrega o valor de _a no registrador $t0
	lw $t1, _b  # Carrega o valor de _b no registrador $t1
	lw $t2, _c  # Carrega o valor de _c no registrador $t2
	
	# somando a + b
	add $s0, $t0, $t1  # $s0 = $t0 + $t1 (a + b)
	
	# somando o resultado com c
	add $s1, $s0, $t2  # $s1 = $s0 + $t2 (a + b + c)
	
	# movendo o valor final para o registrador $a0
	move $a0, $s1  # Coloca o valor de $s1 em $a0 para exibição
	
	# chamando a syscall para imprimir o valor
	li $v0, 1  # Sinaliza a syscall de impressão de inteiro
	syscall    # Executa a impressão
