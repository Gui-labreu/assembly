#esse provavelmente ta errado

.data
	prompt_salario: .asciiz"\nDigite seu salario: "
	teto_isento: .float 2259.20
	teto1: .float 2826.65
	teto2: .float 3751.05
	teto3: .float 4664.68
	aliq1: .float 0.075
	aliq2: .float 0.15
	aliq3: .float 0.225
	aliq4: .float 0.275
	msg_faixa4: .asciiz"\nFaixa 4: "
	msg_faixa3: .asciiz"\nFaixa 3: "
	msg_faixa2: .asciiz"\nFaixa 2: "
	msg_faixa1: .asciiz"\nFaixa 1: "
	msg_isento: .asciiz"\nFaixa Isenta."
	msg_total: .asciiz"\nTotal de impostos: "
	
	
.text
	l.s $f2, teto_isento
	l.s $f3, teto1
	l.s $f4, teto2
	l.s $f5, teto3
	l.s $f13, aliq1
	l.s $f14, aliq2
	l.s $f15, aliq3
	l.s $f16, aliq4
	
	#pede ao usuario o salariow
	li $v0, 4
	la $a0, prompt_salario
	syscall
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	c.lt.s $f1, $f5
	bc1t pula_faixa4
	
	#acima de 4664.58
	sub.s $f6, $f1, $f5
	mul.s $f6, $f6, $f16
	li $v0, 4
	la $a0,msg_faixa4
	syscall
	li $v0, 2
	mov.s $f12, $f6
	syscall
	mov.s $f1, $f5
	
	#entre 4664.68 e 3751.05
	pula_faixa4:
	
	c.le.s $f1, $f4
	bc1t pula_faixa3
	
	sub.s $f7, $f1, $f4
	mul.s $f7, $f7, $f15
	li $v0, 4
	la $a0,msg_faixa3
	syscall
	li $v0, 2
	mov.s $f12, $f7
	syscall
	mov.s $f1, $f4
	
	#entre 3751.05 e 2826.65
	pula_faixa3:
	
	c.le.s $f1, $f3
	bc1t pula_faixa2
	
	sub.s $f8, $f1, $f3
	mul.s $f8, $f8, $f14
	li $v0, 4
	la $a0,msg_faixa2
	syscall
	li $v0, 2
	mov.s $f12, $f8
	syscall
	mov.s $f1, $f3
	
	pula_faixa2:
	
	c.le.s $f1, $f2
	bc1t pula_faixa1
	
	sub.s $f9, $f1, $f2
	mul.s $f9, $f9, $f13
	li $v0, 4
	la $a0,msg_faixa1
	syscall
	li $v0, 2
	mov.s $f12, $f9
	syscall
	mov.s $f1, $f2
	
	pula_faixa1:
	
	li $v0, 4
	la $a0, msg_isento
	syscall
	
	#calculo total
	
	
	
	add.s $f12, $f9, $f8
	add.s $f12, $f12, $f7
	add.s $f12, $f12, $f6
	
	li $v0, 4
	la $a0, msg_total
	syscall
	li $v0, 2
	syscall
	
	
	
	
