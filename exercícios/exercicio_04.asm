# 4 – Escreva o procedimento do programa ao lado 
# que ordena um vetor com N posições e mostre os 
# elementos desse vetor em ordem crescente.

.data
	_msmValores: .asciiz "Digite os 5 valores do vetor: "
	Array:
		.align 2
		.space 20 # aloca 5 espaços no array
	# definindo váriavel p = 0
	_p: .word 0
.text
	
	main:
		move $t0,$zero # indice do array
		li $t2,20 # tamanho do array
		li $v0, 4
		la $a0,_msmValores
		syscall
		jal LendoValores
		
		# ordena o vetor
		jal OrdenadoVetor
	 OrdenandoVetor:
	 	# carregando p da memória
	 	lw $t1,_p
	 	# if (len > p) - se o tamanho do vetor for maior que 0
	 	bgt $t2,$a0,forLoop
	 	j fimPrograma
	 	
	 	forLoop:
	 		# i = $t5
	 		addi $t5,$t1,$zero 
	 		# if(array[p] > array[i]
	 		
	 fimPrograma:
	 	li $v0,10
	 	syscall
	 	
	 LendoValores:
		beq $t0,$t2,sairLoop
		li $v0,5
		syscall
		sw $v0,Array($t0)
		addi $t0,$t0,4
		
		j LendoValores
	sairLoop:
		move $t0,$zero # indice do array
		# imprimindo o array original
		imprimir:
			beq $t0,$t2,final
			
			li $v0,1
			lw $a0,Array($t0)
			syscall
			addi $t0,$t0,4
			
			j imprimir
		
	
	final:
		j main
		
	