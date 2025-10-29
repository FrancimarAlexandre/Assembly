.data # lida com os dados na memória principal
	# mensagens usadas no mini-game
   	text_incial: .asciiz " _   _  _   _  _   _   \n\n      M I N E   G A M E\n   ADIVINHE O NÚMERO!\n\n _   _  _   _  _   _   \n\n"

	text_valor: .asciiz "Digite um valor entre 1 e 100: "
	
	text_erro_menor: .asciiz "O valor digitado é menor que o número sorteado\n"
	text_erro_maior: .asciiz "O valor digitado é maior que o número sorteado\n"
	
	text_vitoria: .asciiz "Parabéns! o valor digitado está correto"
	text_derrota: .asciiz "Gamer Over! você excedeu o limite de tentativas.\n p número sorteado: "
	
	# valor inicial de tentativas
	tentativas: .word 6
	
	# valor teste 
	n: .word 34
	
.text # área para instruções do programa
.globl main
	main:
		lw $t3,tentativas # carregando tentativas
		li $v0, 42        # código do syscall de random integer
		li $a1, 100       # define o limite superior (gera 0 até 99)
		syscall
		move $t2,$a0 # movendo o valor para $t2
		# exibindo texto inicial
		li $v0,4
		la $a0,text_incial
		syscall
	while: # loop principal do game
		# texto solicitando valor
		li $v0,4
		la $a0,text_valor
		syscall
		
		li $v0,5 # lendo o número
		syscall
		
		move $t1,$v0 # passando o valor do usuário para o registrador $t1
		
		
		#lw $t2,n # carregando o valor teste para o registrador $t2
		
		# condicionais
		beq $t3,$zero,fim_game # if tentativas == 0
		blt $t1,$t2,erro_menor # if valor_digtado < valor_teste
		bgt $t1,$t2,erro_maior # if valor_digtado < valor_teste		
		beq $t1,$t2,vitoria # if valor_digitado == valor_teste
		# finalizando 
		li $v0,10
		syscall
		
	fim_game:
		li $v0,4
		la $a0,text_derrota
		syscall
		li $v0,1
		move $a0,$t2
		
		syscall
		li $v0,10
		syscall
		
	vitoria: # label vitoria
		li $v0,4
		la $a0,text_vitoria
		syscall
		
		li $v0 ,10
		syscall
	erro_menor: # label erro número digitado menor 
		sub $t3,$t3,1 # subtrai 1 no número de tentativas
		li $v0,4
		la $a0,text_erro_menor
		syscall
		
		j while
		
	erro_maior: # label erro número digitado maior 
		sub $t3,$t3,1 # subtrai 1 no número de tentativas
		li $v0,4
		la $a0,text_erro_maior
		syscall
		
		j while
	
	
