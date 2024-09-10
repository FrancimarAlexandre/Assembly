.text

	li $t0, 73
	li $t1, 34
	
	add $t2,$t0,$t1
	
	li $v0,1
	move $a0,$t2
	
	syscall 
	
