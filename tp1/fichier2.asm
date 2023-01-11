.text
ld fN
sub tempoF
st fN
fibonnaci:
ld fN
brz fin
sub substractor
st fN
ld f2
st tempoF
ld f1
st f0
lda f2
adda f1
sta f2
ld tempoF
st f1
br fibonnaci
fin:
ld f2
st res
stop
.data
f0:0
f1:1
f2:1
fN:10
tempoF:3
substractor:1
res:0