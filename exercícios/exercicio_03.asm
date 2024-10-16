.data
	# mensagem 
	_msmBase: .asciiz "Base: "
	_msmExpoente: .asciiz "Expoente: "
	_msmResultado: .asciiz "resultado: "
	_resultado: .word 1
.text
	main:
		
		li $v0,4	
		la $a0,_msmBase	
		syscall
		
		li $v0,5
		syscall
		move $t0,$v0 # $t0 -> base
		
		li $v0,4
		la $a0,_msmExpoente
		syscall 
		
		li $v0,5
		syscall
		move $t1,$v0 # $t1 -> expoente
		j power
		
	power:
		beq $t1,0,finalBase
		lw $a0,_resultado
		mul $t4,$t0,$a0
		sw $t4,_resultado
		subi $t1,$t1,1
		j power
	
	finalBase:
		li $v0,4
		la $a0, _msmResultado
		syscall
		lw $a0,_resultado
		li $v0,1
		syscall
		
		j sair
	sair:
		li $v0,10
		syscall
		
	final:
		li $v0,4
		la $a0,_msmResultado
		syscall

		
