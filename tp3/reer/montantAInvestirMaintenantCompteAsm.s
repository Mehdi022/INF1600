.data
.text
.globl _ZN6Compte29montantAInvestirMaintenantAsmEv

_ZN6Compte29montantAInvestirMaintenantAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %ebx
push 8(%ebp)
call _ZN4Reer15salaireFinalAsmEv   # on fait appel a la fct salaire final
movl %eax, (%ecx)
fildl (%ecx)
movl $100, (%ecx)
filds (%ecx)
movl $4, (%ecx)
filds (%ecx)
fdivp
fld1
faddp
fsts tmp
movl 24(%ebx), %edx         #anneeAvantRetraite
decl %edx

mettreEnPuissance:
flds tmp
fmulp
decl %edx
jnz mettreEnPuissance

fdivrp
movl 28(%ebx), %eax
movl %eax, (%ecx)
fildl (%ecx)
fsubp
fistpl (%ecx)           
movl (%ecx), %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
