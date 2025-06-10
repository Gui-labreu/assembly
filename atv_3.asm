.data
	msg_quarto: .asciiz"\nDigite o numero do quarto: "
	msg_esquerda: .asciiz"\nEsquerda"
	msg_direita: .asciiz"\nDireita"
	dois: .word 2
	msg_repetir: .asciiz"\nDeseja repetir?\n1-Sim\n"
	
.text
	enquanto:
	
	lw $t0, dois
	#pergunta e le o numero do quarto
	li $v0, 4
	la $a0, msg_quarto
	syscall
	
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	#calculo
	rem $t3, $t1, $t0
	
	beqz $t3, par
	
	#caso seja impar
	li $v0, 4
	la $a0, msg_esquerda
	syscall
	j fim
	
	#caso seja par
	par:
	li $v0, 4
	la $a0, msg_direita
	syscall
	j fim
	
	fim:
	#pergunta pro usuario se deseja repetir
	li $v0, 4
	la $a0, msg_repetir
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, enquanto