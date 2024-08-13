.data # lida com os dados na memória principal

	msg: .asciiz "Hello world!" # mensagem a ser exibida para o usuário

.text # área para instruções do programa
	
	
	li $v0,4 # instrução ára impressão de String
	la $a0, msg # indicar o endereço em que está a mensagem
	syscall # Faça! Imprima
		