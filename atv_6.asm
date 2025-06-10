.data
	msg_venda: .asciiz"\nDigite o valor da venda: "
	msg_comissao: .asciiz"\nTotal da comissao: "
	msg_sal_final: .asciiz"\nSalario final: "
	salario: .float 1200.0
	teto: .float 1500.0
	taxa1: .float 0.1
	taxa2: .float 0.2
	msg_repetir: .asciiz"\nDeseja repetir?\n1-Sim\n"
	
.text
	enquanto:
	
	l.s $f1, salario
	l.s $f3, teto
	l.s $f4, taxa1
	l.s $f5, taxa2
	
	la $a0, msg_venda
	li $v0, 4
	syscall
	li $v0, 6
	syscall
	mov.s $f2, $f0
	
	c.le.s $f2, $f3
	bc1t menor
	j maior
	
	
	menor:
	mul.s $f10, $f2, $f4
	add.s $f11, $f1, $f10
	j resultado
	
	maior:
	mul.s $f6, $f2, $f4
	sub.s $f7, $f2, $f3
	mul.s $f8, $f7, $f5
	add.s $f10, $f6, $f8
	add.s $f11, $f1, $f10
	j resultado
	
	resultado:
	
	la $a0, msg_comissao
	li $v0, 4
	syscall
	mov.s $f12, $f10
	li $v0, 2
	syscall
	
	la $a0, msg_sal_final
	li $v0, 4
	syscall
	mov.s $f12, $f11
	li $v0, 2
	syscall
	
	#pergunta pro usuario se deseja repetir
	li $v0, 4
	la $a0, msg_repetir
	syscall
	
	li $v0, 5
	syscall
	
	beq $v0, 1, enquanto
	
	
	
	