.data # lida com os dados na memória principal
	# mensagens usadas no mini-game
   	 text_incial: .asciiz " _   _  _   _  _   _   \n\n      M I N E   G A M E\n   ADIVINHE O NÚMERO!\n\n _   _  _   _  _   _   \n\n"


	
	text_valor: .asciiz "Digite um valor entre 1 e 100: "
	
	text_erro_menor: .asciiz "O valor digitado é menor que o número sorteado"
	text_erro_maior: .asciiz "O valor digitado é maior que o número sorteado"
	
	text_vitoria: .asciiz "Parabéns! o valor digitado está correto"
	text_derrota: .asciiz "Gamer Over! você excedeu o limite de tentativas."
	
	# valor inicial de tentativas
	tentativas: .word 6
	
.text # área para instruções do programa

	# exibindo texto inicial
	li $v0,4
	la $a0,text_incial
	
	syscall