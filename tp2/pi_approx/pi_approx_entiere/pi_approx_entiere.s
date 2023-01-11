.data
valeur:
.int


.text
.globl pi_approx_entiere

pi_approx_entiere:

push %ebp
mov %esp,%ebp
push %ebx

# VOTRE CODE #
reinitialisation:
movl 10(%esp), %ecx

iteration:
movl %ecx,  %eax
addl $0x01, %eax
movl $0x02, %ebx
mull %ebx
subl $0x2,  %eax
movl %eax,  %ebx
movl $0x04, %eax
divl %ebx
pushl %eax
movl %ecx,  %eax
movl $0x00, %edx
movl $0x02, %ebx
divl %ebx
cmp $0x00,  %edx
jnz soustraction
jz addition

addition:
popl %eax
addl %eax,  valeur
jmp verification

soustraction:
popl %eax
subl %eax,  valeur

verification:
loop iteration

fin:
movl %ecx,  %eax
addl $0x01, %eax
movl $0x02, %ebx
mull %ebx
subl $0x01, %eax
movl %eax,  %ebx
movl $0x04, %eax
divl %ebx
addl %eax,  valeur
movl valeur,  %eax

pop %ebx
pop %ebp
ret
