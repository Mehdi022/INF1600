.text
ldi r0, 250
st (r0), r0
ldi r0, 251
st (r0), r0
ldi r0, 252
st (r0), r0
ldi r0, 253
st (r0), r0
ldi r0, 254
st (r0), r0
ldi r0, 255
st (r0), r0
ldi r31, 256
ldi r0, 2
ldi r1, 3
ldi r2, 4
ldi r3, 5
ldi r4, 6
ldi r5, 7
ldi r29, 1

sub r31, r31, r29
st 0(r31), r0
sub r31, r31, r29
st 0(r31), r1
sub r31, r31, r29
st 0(r31), r2
sub r31, r31, r29
st 0(r31), r3
sub r31, r31, r29
st 0(r31), r4
sub r31, r31, r29
st 0(r31), r5

stop

