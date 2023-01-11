.data
string1:
.ascii  "AazZWgFh tuvJKLYZHj" # Le message à decoder AazZWgFF donne une lettre ASCII, tuvJKLYZH donne l'autre. 
string2:
.ascii "\n\0"

.text
.globl main

main : 
push %ebp
mov %esp,%ebp
push %ebx

#Votre code ici
reinitialisation:
movl $0x00,%edx
movl $0x00,%ebx
movl $string1,%esi

iteration:
movl $0x0A, %ecx  # ecx = 10 le diviseur pour avoir le reste de la division euclidiene
lodsb
and $0xFF, %eax
cmpl $0x20,%eax    
je printPremierLettre    # print le 1 mot
cmpl $0, %eax
je printDeuxiemeLettre # print le 2eme mot considere dans cette exercice le dernier mot
divl %ecx       # premier division a 10 pour recevoir le 1 nombre
add %edx, %ebx  # on l ajoute dans le registre ebx 
movl $0, %edx   # pour s assurer que edx est null
divl %ecx       # on redivise par 10 au cas ou si le asci est de 3 nombre dans le cas de lettre min
add %edx, %ebx  # on l ajoute dans le registre ebx 
add %eax, %ebx  # on ajoute la quotient
movl $0, %edx   # pour s assurer que edx est null
jmp iteration   # on relance la boucle

printPremierLettre:
pushl %ebx
call printf # affiche le 1 mot
add $4,%esp
popl %ecx
movl $0, %ebx # rend la valeur de ebx = 0 pour continuer le prochain mot
jmp iteration

printDeuxiemeLettre:
pushl %ebx
call printf
popl %ecx
add $4, %esp

fin:
pushl $string2
call printf
popl %ecx

pop %ebx
pop %ebp
ret
