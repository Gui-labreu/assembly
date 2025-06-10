.data
	msg_peso: .asciiz"\nDigite seu peso: "
	msg_altura: .asciiz"\nDigite sua altura: "
	msg_imc: .asciiz"\nSeu imc e: "
	msg_magreza_grave: .asciiz"\nmagreza grave"
	msg_magreza_moderada: .asciiz"\nmagreza moderada"
	msg_magreza_leve: .asciiz"\nmagreza leve"
	msg_saudavel: .asciiz"\nsaudavel"
	msg_sobrepeso: .asciiz"\nsobrepeso"
	msg_obe_I: .asciiz"\nobesidade grau I"
	msg_obe_II: .asciiz"\nobesidade grau II"
	msg_obe_III: .asciiz"\nobesidade grau III"
	msg_repetir: .asciiz"\nDeseja repetir?\n1-Sim\n"
		
	#valores de comparacao
	f16: .float 16.0
	f17: .float 17.0
	f18.5: .float 18.5
	f25: .float 25.0
	f30: .float 30.0
	f35: .float 35.0
	f40: .float 40.0

.text
	enquanto:
	#apresenta a msg_peso
	li $v0, 4
	la $a0, msg_peso
	syscall
	
	#leitura do peso como float
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	#apresenta a msg_altura
	li $v0, 4
	la $a0, msg_altura
	syscall
	
	#leitura do altura como float
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	#calculo do quadrado da altura
	mul.s $f3, $f2, $f2
	
	#calculo do imc
	div.s $f12, $f1, $f3
	
	#mostra o imc
	li $v0, 4
	la $a0, msg_imc
	syscall
	li $v0 2
	syscall
	
	#carrega os valores de comparacao
	l.s $f4, f16
	l.s $f5, f17
	l.s $f6, f18.5
	l.s $f7, f25
	l.s $f8, f30
	l.s $f9, f35
	l.s $f10, f40
	
	#comparacoes
	c.lt.s $f12, $f4
	bc1t magreza_grave
	
	c.lt.s $f12, $f5
	bc1t magreza_moderada
	
	c.lt.s $f12, $f6
	bc1t magreza_leve
	
	c.lt.s $f12, $f7
	bc1t saudavel
	
	c.lt.s $f12, $f8
	bc1t sobrepeso
	
	c.lt.s $f12, $f9
	bc1t obe_grau_I
	
	c.lt.s $f12, $f10
	bc1t obe_grau_II
	
	#caso passe falso em todas as comparacoes
	li $v0, 4
	la $a0, msg_obe_III
	syscall
	j fim
	
	#casos
	magreza_grave:
	li $v0, 4
	la $a0, msg_magreza_grave
	syscall
	j fim
	
	magreza_moderada:
	li $v0, 4
	la $a0, msg_magreza_moderada
	syscall
	j fim
	
	magreza_leve:
	li $v0, 4
	la $a0, msg_magreza_leve
	syscall
	j fim
	
	saudavel:
	li $v0, 4
	la $a0, msg_saudavel
	syscall
	j fim
	
	sobrepeso:
	li $v0, 4
	la $a0, msg_sobrepeso
	syscall
	j fim
	
	obe_grau_I:
	li $v0, 4
	la $a0, msg_obe_I
	syscall
	j fim
	
	obe_grau_II:
	li $v0, 4
	la $a0, msg_obe_II
	syscall
	j fim
	
	fim:
	#pergunta ao usuario se deseja repetir
	li $v0, 4
	la $a0, msg_repetir
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, enquanto
