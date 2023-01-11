.text
.globl syracuse_s_rec
.globl afficher

syracuse_s_rec:
pushl %ebp
movl %esp, %ebp
pushl %ebx


# DEBUT COMPLETION
movl 12(%ebp), %ebx  #initialiser le compteur à 0 
movl 8(%ebp), %eax   #initialiser %eax à 15


Iteration:
jmp FonctionAfficher

SuiteIteration:
cmpl $1, %eax
je Fin
addl $1, %ebx
pushl %ebx
pushl %eax 

#Déterminer si pair ou impair
movl $2, %ecx  
movl $0, %edx  
divl %ecx
cmpl $0, %edx
jne Impair 
je Pair


Pair:
popl %eax
movl $2, %ecx
divl %ecx
jmp FonctionSyracuse
    

Impair:
popl %eax
movl $3, %ecx
mull %ecx
addl $1, %eax
jmp FonctionSyracuse


FonctionAfficher:
pushl %eax
pushl %ebx
call afficher
popl %ebx
popl %eax
jmp SuiteIteration


FonctionSyracuse:
pushl %ebx
pushl %eax
call syracuse_s_rec
popl %eax
popl %ebx
jmp Fin
    

# FIN COMPLETION
Fin:
movl %ebx, %eax 


# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
