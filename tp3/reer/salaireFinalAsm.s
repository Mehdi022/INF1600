.data
.text
.globl	_ZN4Reer15salaireFinalAsmEv

_ZN4Reer15salaireFinalAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %ebx # salaireDepart


#on a dans ebx tout les constantes qu'on aura besoin 


movl $100, (%ecx)
filds (%ecx)
filds 12(%ebx)  # augmentationSalariale
fdivp
movl $1, (%ecx)
filds (%ecx)
faddp                       #l'operation qu'on a fait est augmentationSalariale/100 +1
movl 24(%ebx), %edx         #anneeAvantRetraite en puissance
sub $2, %edx                
fsts tmp

mettreEnPuissance:
flds tmp
fmulp
decl %edx
jnz mettreEnPuissance

fildl 8(%ebx)
fmulp
fistpl (%eax)
movl (%eax), %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
