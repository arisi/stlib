.syntax unified
	.file "systick.S"
	.text
	.thumb
	.thumb_func
	.align 2
	.global SysTick_Handler
	.type SysTick_Handler, %function

SysTick_Handler:
	movw r0,#0xed04   /* scb_icsr  = system int status */
	movt r0,#0xe000	
	ldr r1,[r0]
	bic r1,#0x04000000  /* systick int status */
	orr r1,#0x02000000  /* clear status bit */
	str r1,[r0] 
	
	movw r0,#:lower16:stcount_raw  /* stcount+1 */
	movt r0,#:upper16:stcount_raw
	ldr r1,[r0]
	add r1,#1
	str r1,[r0]
	 
	 /* systick taajuuden mittaus
	movw r3,#0x0c00  
	movt r3,#0x4002
	ldr r2,[r3,#20]
	eor r2,#4
	str r2,[r3,#20]
	*/
#if 0
        ands r2,r1,#0x007f     /* merkkaa flag jos stcount modulo 128=0 */ 
	cbnz r2,st5
	movw r0,#:lower16:mflag
	movt r0,#:upper16:mflag
	lsr r1,#7              /*  flag=stcount>>7 modulo 7 */
	and r1,#7
	str r1,[r0]
#endif	
st5:
        movw r0,#:lower16:laskurit /* vahenna laskureita */
	movt r0,#:upper16:laskurit
	ldr r1,[r0]
	cbz r1,st1
	sub r1,1
	str r1,[r0]
st1:    
	ldr r1,[r0,#4]!
	cbz r1,st2
	sub r1,1
	str r1,[r0]
st2:    
	ldr r1,[r0,#4]!
	cbz r1,st3
	sub r1,1
	str r1,[r0]
st3:    
	ldr r1,[r0,#4]!
	cbz r1,st4
	sub r1,1
	str r1,[r0]
st4:    
	bx lr