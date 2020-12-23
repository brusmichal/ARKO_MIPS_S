#Michał Brus, 299106
#zad 7c
#Pierwszy i drugi znak ciągu znakowego są znacznikami (początkowym i końcowym) definiującymi podciąg
#tego ciągu. Zadanie polega na zamianie wszystkich znaków przed pierwszym wystąpieniem znacznika
#początkowego i po pierwszym wystąpieniu znacznika końcowego na znak *. Jeśli w ciągu (od czwartego
#znaku) nie występuje znacznik początkowy lub końcowy to nie należy dokonywać zmian. Pierwsze trzy znaki
#ciągu wejściowego należy zamienić na spacje.
#Input string > oh:wind on the hill
#Conversion results> *****on th******

.data 
	buffor: .space 50
	
.text
	main:
	
		la $a0, buffor
		li $a1, 50
		li $v0, 8
		syscall
		
		la $t0, buffor #adres poczatku bufora do $t0; i=0
		lb $t1, ($t0) # begin = buffor[0]
		addiu $t0, $t0, 1 # i=1
		lb $t2, ($t0) # end = buffor[1]
	
		li $t3, 0 # pos_begin = 0
		li $t4, 0 # pos_end = 0
	
		addiu $t0, $t0, 2 # i=3
		
	loop:
		lb $t5, ($t0) #wartosc buffor[i] do $t5
		beqz $t5, pre_third_loop #buffor[i] == '\0'
		bnez $t3, condition
	loop_cd:
		beqz $t3, continue_1
		beqz $t4, continue_2
				
		
	pre_second_loop:
		la $t0, buffor #adres poczatku bufora do $t0; i=0
		
		beqz $t3, pre_third_loop
		beqz $t4, pre_third_loop
		
	second_loop:
		lb $t5, ($t0) #wartosc buffor[i] do $t5
		beqz $t5, pre_third_loop #buffor[i] == '\0'
		blt $t0, $t3, to_star
		bgt $t0, $t4, to_star
		j increment_2
		
		
	pre_third_loop:
		la $t0, buffor #adres poczatku bufora do $t0; i=0
		li $t6, 0 #j=0
		
	third_loop:
		beq $t6, 3, next
		li $t5, ' '
		sb $t5, ($t0)
		addiu $t6, $t6, 1
		addiu $t0, $t0, 1
		j third_loop
		
	next:
		la $a0, buffor
		li $v0, 4
		syscall
		j exit
	exit: 
		li $v0, 10
		syscall
		
		
	
		
	condition:
		bnez $t4, pre_second_loop
		j loop_cd
	continue_1:
		beq $t5, $t1, flag_1  #buffor[i] == begin
		j increment
		
	flag_1:
		la $t3, ($t0) # pos_begin = i
		j increment
		
	continue_2:
		beq $t5, $t2, flag_2 #buffor[i] == end
		j increment
		
	flag_2:
		la $t4,($t0) #pos_end = i
		j increment
		
	increment:
		addiu $t0, $t0, 1
		j loop
	to_star:
		li $t5, '*'
		sb $t5, ($t0)
		j increment_2
		
	increment_2:
		addiu $t0, $t0, 1
		j second_loop
		
	

		
		
		
		
	
	
	
