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
ldi r31, 250
ldi r29, 1

ld r1, 0(r31)
add r31, r31, r29
ld r2, 0(r31)
add r31, r31, r29
ld r3, 0(r31)
add r31, r31, r29
ld r4, 0(r31)
add r31, r31, r29
ld r5, 0(r31)
add r31, r31, r29
ld r6, 0(r31)
add r31, r31, r29

stop

