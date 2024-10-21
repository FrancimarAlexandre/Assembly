.data	
	# diretório do arquivo
	dir_arq: .asciiz "/home/apenasudev/Documents/github/Assembly/projetos/Sig - cadastro de usuários/data.txt"  
	# buffer para o conteúdo do arquivo
	conteudoArq: .space 1024  # reservando 1024 bytes para o conteúdo do arquivo
	# mensagem do menu
	_msmMenu: .asciiz "##########################\n1)- Cadastrar novo cliente \n2)- Listar Clientes \n3)- Sair\n"

.text

main:
		# Exibindo o menu
		li $v0, 4              # serviço para imprimir string
		la $a0, _msmMenu       # carregar o endereço da string do menu
		syscall
		
		# Input da opção
		li $v0, 5              # serviço para ler inteiro
		syscall
		move $t0, $v0          # salvar opção escolhida em $t0
		
		# Condições para verificar a escolha do usuário
		beq $t0, 1, cadastro
		beq $t0, 2, listar
		beq $t0, 3, sair
		
		# Se a opção não for válida, retorna ao menu
		j main

sair:
		# Saída do programa
		li $v0, 10
		syscall

cadastro:
		# Código de cadastro do cliente (a ser implementado)
		j main  # Retorna ao menu após cadastro

listar:
		# Abrir o arquivo em modo de leitura
		li $v0, 13               # serviço para abrir arquivo
		la $a0, dir_arq           # carregar endereço do arquivo
		li $a1, 0                 # modo de leitura (0: leitura)
		li $a2, 0                 # permissão (não relevante em leitura)
		syscall
		bltz $v0, erro_arquivo    # verifica se houve erro ao abrir o arquivo
		move $s0, $v0             # salvar descritor de arquivo em $s0
		
		# Ler conteúdo do arquivo
		li $v0, 14               # serviço de leitura de arquivo
		move $a0, $s0            # descritor do arquivo
		la $a1, conteudoArq       # buffer para armazenar o conteúdo
		li $a2, 1024             # número de bytes a serem lidos
		syscall
		bltz $v0, erro_leitura    # verifica se houve erro na leitura
		
		# Imprimir o conteúdo do arquivo
		li $v0, 4                # serviço de impressão de string
		la $a0, conteudoArq       # endereço do buffer com o conteúdo lido
		syscall
		
		# Fechar o arquivo
		li $v0, 16               # serviço para fechar arquivo
		move $a0, $s0            # descritor do arquivo
		syscall
		
		# Retornar ao menu
		j main

erro_arquivo:
		# Mensagem de erro ao abrir arquivo
		li $v0, 4
		la $a0, erro_abrir
		syscall
		j main

erro_leitura:
		# Mensagem de erro ao ler arquivo
		li $v0, 4
		la $a0, erro_ler
		syscall
		j main

.data
	erro_abrir: .asciiz "Erro ao abrir o arquivo.\n"
	erro_ler: .asciiz "Erro ao ler o arquivo.\n"
