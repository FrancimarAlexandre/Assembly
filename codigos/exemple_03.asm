# verificação de idade
.data
	_msmIdade: .asciiz "Digite sua idade: "
	_msmMaior: .asciiz "Você é maior de idade: "
	_msmMenor: .asciiz "Você é menor de idade: "
.text
	li $v0,4
	la $a0,_msmIdade
	syscall
	li $v0,5
	syscall
	move $s0,$v0
	bge $s0,18,maior
	li $v0,4
	la $a0,_msmMenor
	syscall
	li $v0,10
	syscall
	maior:
		li $v0,4
		la $a0,_msmMaior
		syscall
		li $v0,10
		syscall
