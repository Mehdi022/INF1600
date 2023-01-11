.text
ld a
sub b
st temp
st temp2
moins_un:
ld temp
sub increment
brz max_a
st temp
plus_un:
ld temp2
add increment
brz max_b
st temp2
br moins_un
max_a:
ld a
st res
stop
max_b:
ld b
st res
stop
.data
res:0
increment:1
temp:0
temp2:0
a:1
b:4