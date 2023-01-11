.data
.text
.globl _ZN4Reer30montantAEpargnerChaqueAnneeAsmEv

_ZN4Reer30montantAEpargnerChaqueAnneeAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %ebx
push 8(%ebp)
call _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv  # on fait appel a la fct montant final avant retraite
movl %eax, (%ecx)
fildl (%ecx)
movl $100, (%ecx)
filds (%ecx)
filds 20(%ebx)  #tauxInteret
fdivp
fsts tmp
flds tmp
fld1
faddp
fsts tmp
movl 24(%ebx), %edx       #anneeAvantRetraite
decl %edx  

mettreEnPuissance:
flds tmp
fmulp
decl %edx
jnz mettreEnPuissance

fld1
fsubrp
fdivrp
fmulp
fistpl (%ecx)           
movl (%ecx), %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
