.text
ldi r0, number
ld r0, (r0)
ldi r1, odd_detector
ld r1, (r1)
ldi r2, inc
ld r2, (r2)
ldi r10, zero
ld r10, (r10)
detector:
and r4, r0, r1
brnz is_odd
br even
is_odd:
add r2, r2, r1
shr r0, r0
brnz detector
br fin
even:
shr r0, r0
brnz detector
fin:
mv r0, r2
stop
.data
awnser:0
number: 73
odd_detector: 1
zero: 0
inc:0
