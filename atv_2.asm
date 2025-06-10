.data
	#mensagens utilizadas
	msg1: .asciiz"\nDigite seu salario: "
	msg_desconto: .asciiz"\nO desconto foi de: "
	msg_salario: .asciiz"\nSalario final: "
	msg_repetir: .asciiz"\nDeseja repetir?\n1-Sim\n"
	
	#valores utilizados
	teto1: .float 1659.38
	teto2: .float 2765.66
	teto3: .float 5531.31
	aliq1: .float 0.08
	aliq2: .float 0.9
	aliq3: .float 0.11
.text
	enquanto:
	#carrega os valores dos tetos e aliquotas
	l.s $f1, teto1
	l.s $f2, teto2
	l.s $f3, teto3
	l.s $f4, aliq1
	l.s $f5, aliq2
	l.s $f6, aliq3
	
	#imprime a msg1 e le o salario
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 6
	syscall
	mov.s $f7, $f0
	
	#comparacoes do salario com os tetos
	c.lt.s $f7, $f1
	bc1t caso1
	
	c.lt.s $f7, $f2
	bc1t caso2
	
	c.lt.s $f7, $f3
	bc1t caso3
	
	#caso passe por todas as comparacoes
	mul.s $f8, $f6, $f3
	sub.s $f9, $f7, $f8
	j impressao
	
	#casos
	caso1:
	mul.s $f8, $f7, $f4
	sub.s $f9, $f7, $f8
	j impressao
	
	caso2:
	mul.s $f8, $f7, $f5
	sub.s $f9, $f7, $f8
	j impressao
	
	caso3:
	mul.s $f8, $f7, $f6
	sub.s $f9, $f7, $f8
	j impressao
	
	#apresenta o resultado
	impressao:
	li $v0, 4
	la $a0, msg_desconto
	syscall
	
	mov.s $f12, $f8
	li $v0, 2
	syscall
	
	li $v0, 4
	la $a0, msg_salario
	syscall
	
	mov.s $f12, $f9
	li $v0, 2
	syscall
	
	#pergunta pro usuario se deseja repetir
	li $v0, 4
	la $a0, msg_repetir
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, enquanto
	
	
	
	
