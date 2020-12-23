#zadanie
#Wszystkie małe litery w ciągu powinny zostać zamienione na *

.data
	buffor: .space 50

.text
	main:
		la $a0, buffor
		li $a1, 50
		li $v0, 8
		syscall
		
		la $t1, buffor
		li $t2, 0 # current = 0
		
	loop:
		lb $t2, ($t1) #current = buffer[i]
		beqz $t2, print #if current == '\0' then print
		blt $t2, 'a', increment
		bgt $t2, 'z' , increment
		li $t2, '*'
		sb $t2, ($t1)
		j increment
		
		
	print:
		
		la $a0, buffor
		li $v0, 4
		syscall
		j exit
	
	increment:
		addiu $t1, $t1, 1
		j loop
	exit:
		li $v0, 10
		syscall
		