.syntax unified
.file "systick.S"
.text
.thumb
.thumb_func
.align 2
.code 16
.global SysTick_Handler
.type SysTick_Handler, %function

SysTick_Handler:
	//bx lr


	ldr r0,=0xe000ed04
	ldr r1,[r0]
	ldr r2,=0x04000000
	bics r1,r2  /* systick int status */
	ldr r2,=0x02000000
	orrs r1,r2  /* clear status bit */
	str r1,[r0]


	//movw r0,#:lower16:stcount  /* stcount+1 */
	//movt r0,#:upper16:stcount
	ldr r0,=stcount_raw
	ldr r1,[r0]
	adds r1,#1
	str r1,[r0]


	 /* systick taajuuden mittaus -  ei kaytossa
	//movw r3,#0x0c00
	//movt r3,#0x4002
	ldr r3,0x40020c00
	ldr r2,[r3,#20]
	eor r2,#4
	str r2,[r3,#20]
	*/

        movs r2,#0x7f
	ands r2,r1     /* merkkaa flag jos stcount modulo 128=0 */
	//cmp r2,0
	bne st5
	//movw r0,#:lower16:mflag
	//movt r0,#:upper16:mflag
	ldr r0,=mflag
	lsrs r1,#7              /*  flag=stcount>>7 modulo 7 */
	movs r2,#7
	ands r1,r2
	str r1,[r0]

st5:
        //movw r0,#:lower16:laskurit /* vahenna laskureita */
	//movt r0,#:upper16:laskurit
	ldr r0,=laskurit
	ldr r1,[r0]
	cmp r1,0
	beq st1
	subs r1,1
	str r1,[r0]
st1:
	ldr r1,[r0,#4]
	cmp r1,0
	beq st2
	subs r1,1
	str r1,[r0,4]
st2:
	ldr r1,[r0,#8]
	cmp r1,0
	beq st3
	subs r1,1
	str r1,[r0,8]
st3:
	ldr r1,[r0,#12]
	cmp r1,0
	beq st4
	subs r1,1
	str r1,[r0,12]
st4:
	bx lr
