.data
	_a: .word 2
	_b: .word 1
	# Mensagens
	_msmAnd: .asciiz "AND: "
	_msmOr: .asciiz "\nOR: "
	_msmNor: .asciiz "\nNOR: "

.text
.globl main

main:
	# Carrega os valores de _a e _b
	lw $t0, _a           
	lw $t1, _b           
	
	# AND
	li $v0, 4            # Syscall para imprimir string
	la $a0, _msmAnd      # Carrega o endereço da string "AND: "
	syscall              # Chama o syscall
	
	and $s0, $t0, $t1    # $s0 = $t0 AND $t1
	move $a0, $s0        # Move o resultado para $a0
	li $v0, 1            # Syscall para imprimir inteiro
	syscall              # Chama o syscall
	
	# OR
	li $v0, 4            # Syscall para imprimir string
	la $a0, _msmOr       # Carrega o endereço da string "OR: "
	syscall              # Chama o syscall
	
	or $s1, $t0, $t1     # $s1 = $t0 OR $t1
	move $a0, $s1        # Move o resultado para $a0
	li $v0, 1            # Syscall para imprimir inteiro
	syscall              # Chama o syscall
	
	# NOR
	li $v0, 4            # Syscall para imprimir string
	la $a0, _msmNor      # Carrega o endereço da string "NOR: "
	syscall              # Chama o syscall
	
	nor $s2, $t0, $t1    # $s2 = $t0 NOR $t1
	move $a0, $s2        # Move o resultado para $a0
	li $v0, 1            # Syscall para imprimir inteiro
	syscall              # Chama o syscall
	
	# Encerrar o programa
	li $v0, 10           # Syscall para sair do programa
	syscall
