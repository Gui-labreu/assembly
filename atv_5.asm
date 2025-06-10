.data
	msg_dimensoes: .asciiz"\nDigite todas as dimenoes em metros"
	msg1: .asciiz"\nDigite a primeira dimensão do primeiro lado: "
	msg2: .asciiz"\nDigite a segunda dimensão do primeiro lado: "
	msg3: .asciiz"\nDigite a primeira dimensão do segundo lado: "
	msg4: .asciiz"\nDigite a segunda dimensão do segundo lado: "
	msg5: .asciiz"\nDigite a primeira dimensão do terceiro lado: "
	msg6: .asciiz"\nDigite a segunda dimensão do terceiro lado: "
	msg7: .asciiz"\nDigite a primeira dimensão do quarto lado: "
	msg8: .asciiz"\nDigite a segunda dimensão do quarto lado: "
	msg9: .asciiz"\nDigite a primeira dimensão do quinto lado: "
	msg10: .asciiz"\nDigite a segunda dimensão do quinto lado: "
	msg_area_piscina: .asciiz"n\A area da piscina em m2: "
	msg_ladrilho1: .asciiz"\nDigite a primeira dimensao do ladrilho: "
	msg_ladrilho2: .asciiz"\nDigite a segunda dimensao do ladrilho: "
	msg_area_ladrilho: .asciiz"\nArea do ladrilho em m2: "
	msg_qtd_ladrilho: .asciiz"\nQuantidade de ladrilhos necessaria: "
	msg_repetir: .asciiz"\nDeseja repetir?\n1-Sim\n"
	
.text

	enquanto: 
	la $a0, msg_dimensoes
	li $v0, 4
	syscall




	la $a0, msg1
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	la $a0, msg2
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	la $a0, msg3
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f3, $f0
	
	la $a0, msg4
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f4, $f0
	
	la $a0, msg5
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f5, $f0
	
	la $a0, msg6
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f6, $f0
	
	la $a0, msg7
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f7, $f0
	
	la $a0, msg8
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f8, $f0
	
	la $a0, msg9
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f9, $f0
	
	la $a0, msg10
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f10, $f0
	
	la $a0, msg_ladrilho1
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f19, $f0
	
	la $a0, msg_ladrilho2
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f20, $f0
	
	#calculo das areas
	
	mul.s $f13, $f1, $f2
	mul.s $f14, $f3, $f4
	mul.s $f15, $f5, $f6
	mul.s $f16, $f7, $f8
	mul.s $f17, $f9, $f10
	mul.s $f21, $f19, $f20
	
	#somatorio
	add.s $f18, $f13, $f14
	add.s $f18, $f18, $f15
	add.s $f18, $f18, $f16
	add.s $f18, $f18, $f17
	
	#calc qtde de ladrilho
	div.s $f22, $f18, $f21
	
	#mostrar area
	
	la $a0, msg_area_piscina
	li $v0, 4
	syscall
	mov.s $f12, $f18
	li $v0, 2
	syscall
	
	la $a0, msg_area_ladrilho
	li $v0, 4
	syscall
	mov.s $f12, $f21
	li $v0, 2
	syscall
	
	
	la $a0, msg_qtd_ladrilho
	li $v0, 4
	syscall
	mov.s $f12, $f22
	li $v0, 2
	syscall
	
	#pergunta pro usuario se deseja repetir
	li $v0, 4
	la $a0, msg_repetir
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, enquanto
	
	
	
