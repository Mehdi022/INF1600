.text
.globl quicksort_s
quicksort_s:
pushl %ebp
movl %esp, %ebp
pushl %ebx
# DEBUT COMPLETION
movl 12(%ebp), %ecx
addl CUTOFF, %ecx
cmpl 16(%ebp), %ecx
jg retour               # verifie la taille du tableau si c'est inférieur à 2 le programe s'arrette

movl 16(%ebp), %edx
movl 12(%ebp), %ebx
movl 8(%ebp), %ecx

pushl %edx             #right
pushl %ebx             #left
pushl %ecx
call medianOfThree     # cette fonction nous donne le pivot 
popl %ecx
popl %ebx
popl %edx
movl %eax, %edi        # on transfere le pivot dans le registre %edi

            # quicksort fonction

movl 12(%ebp), %ebx     #%ebx prend la valeur de l'extremite gauche (i)
movl 16(%ebp), %esi     
dec %esi                #%esi prend la valeur de l'extremite droite (k-1)

boucleFor:
movl 8(%ebp), %edx

partieGaucheBoucle:
incl %ebx
cmpl %edi,(%edx,%ebx,4)
jb partieGaucheBoucle

partieDroiteBoucle:
dec %esi
cmpl %edi,(%edx,%esi,4)
ja partieDroiteBoucle

cmpl %esi, %ebx
ja breakBoucle

            # appel fonction de swaprefs de la facon ==>  swapRefs(T_, i, k)

swapRef:    
pushl %esi         #k
pushl %ebx         #i
pushl 8(%ebp)
call swapRefs
popl 8(%ebp)
popl %ebx
popl %esi
jmp boucleFor 

breakBoucle:
movl 16(%ebp), %esi     #Sortir car partitionnement termine
dec %esi                #%esi egal à right -1

            # appel fonction de swaprefs de la facon ==>  (T_, i, right - 1)

swap:
pushl %esi      #right - 1
pushl %ebx      #i
pushl 8(%ebp)
call swapRefs
popl 8(%ebp)
popl %ebx
popl %esi

                # on refait appel a la fonction quicksort mais dans ce cas la on fait la partie à gauche du pivot afin de Trier ses elements

quickSortEnBas:
decl %ebx             
pushl %ebx              #i-1
pushl 12(%ebp)          #left
pushl 8(%ebp)
call quicksort_s
popl 8(%ebp)
popl 12(%ebp)
popl %ebx

                # on refait appel a la fonction quicksort mais dans ce cas la on fait la partie à droite du pivot afin de Trier ses elements

quickSortEnHaut:
add $2, %ebx            #ebx = i-1 on veut i+1 donc on add 2
pushl 16(%ebp)          #right
pushl %ebx              #i+1
pushl 8(%ebp)
call quicksort_s
popl 8(%ebp)
popl %ebx
popl 16(%ebp)

# FIN COMPLETION
# NE RIEN MODIFIER APRES CETTE LIGNE
retour:   
popl %ebx
leave
ret
