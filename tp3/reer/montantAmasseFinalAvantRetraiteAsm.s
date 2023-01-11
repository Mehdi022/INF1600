.data
.text
.globl _ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv

_ZN4Reer34montantAmasseFinalAvantRetraiteAsmEv:
pushl %ebp
movl %esp, %ebp
# DEBUT COMPLETION

movl 8(%ebp), %ebx
push 8(%ebp)
call _ZN4Reer15salaireFinalAsmEv  # on fait appel a la fct salaire final
movl %eax, (%ecx)
fildl (%ecx)
movl $100, (%ecx)
filds (%ecx)
filds 16(%ebx)  #pourcentageSalaireVouluRetraite
fdivp
fmulp
movl $100, (%ecx)
filds (%ecx)
filds 20(%ebx)  #tauxInteret
fdivp
movl $1, (%ecx)
filds (%ecx)
faddp  
fsts tmp
movl 4(%ebx), %edx      #anneeAvantRetraite en puissance    
decl %edx  

mettreEnPuissance:
flds tmp
fmulp
decl %edx
jnz mettreEnPuissance

fsts tmp
fld1
fsubrp
movl $100, (%ecx)
filds (%ecx)
filds 20(%ebx) #tauxInteret
fdivp
flds tmp
fmulp
fdivrp
fmulp
fistpl (%ecx)           
movl (%ecx), %eax

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:
leave
ret
