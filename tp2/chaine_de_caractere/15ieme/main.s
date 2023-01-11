.data
string:
.asciz "My favourite number is FIFTEEN!\n"
string2:
.ascii "%c\0"
messageEstAlphabet:
.asciz " est une lettre de l'alphabet!\n"
messageNonAlphabet:
.ascii "Ce n'est pas une lettre de l'alphabet.\n"


.text
.globl main

main : 
push %ebp
mov %esp,%ebp
push %ebx

#votre code
reinitialisation:
movl $0xF,%ebx # on lui donne la valeur de 15
movl $string,%esi

iteration:
lodsb
sub $0x01,%ebx  #on le decremente de 1 a chaque fois
cmpl $0x00,%ebx #voir si ca arrive a 0
je lettreTrouve    #si egal a 1 donc on est arrive a la 15 eme lettre
jmp iteration

lettreTrouve:
and $0xFF,%eax #masque
cmpl $0x41,%eax  # verifient que la valeur ascii existe dans l alphabet
jb fin
cmpl $0x7a,%eax  # verifient que la valeur ascii existe dans l alphabet
jg fin
cmpl $0x5a,%eax # verifient que la valeur ascii existe dans l alphabet
jbe printLettre
cmpl $0x61, %eax # verifient que la valeur ascii existe dans l alphabet
jb fin

printLettre:
push %eax
pushl $string2
call printf
add $4,%esp
popl %ecx
push $messageEstAlphabet
call printf
add $4,%esp
jmp arret

fin:
push $messageNonAlphabet
call printf
add $4,%esp


arret:
popl %ebx
popl %ebp
ret
