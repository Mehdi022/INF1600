.data
i:             
.float  0       # i
iteration:
.int 50         # Nombre d'itérations
x:
.float 2       
y:
.float 1
signe1:
.float 1
signe2:
.float -1
pi:             # Valeur du ratio de pi initial
.float 0
cte: 
.float 1
multiplicateur:
.float 4
.text
.globl pi_approx_flottante

pi_approx_flottante:

push %ebp       # Prologue
mov %esp,%ebp
push %ebx

#votre code
reinitialisation:
movl $iteration, %eax # nombre de fois a iterer
movl $1, (%ecx)   
fldz                    # on load 0 dans la pile

boucle:
filds (%ecx)    
flds cte       
fdivp  
faddp    
addl $2, (%ecx)
decl (%eax)     # decremente le comptuer de 1
jz fin    
filds (%ecx) 
flds cte
fdivp
fsubrp  
addl $2, (%ecx)
decl (%eax)
jz fin
jmp boucle

fin:
fmul multiplicateur  # on a comme reponse final 1 sur 4 de pi donc il faudrait le multiplier de 4

pop %ebx
pop %ebp
ret
