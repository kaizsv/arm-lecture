	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r2, r3, r4, r5, lr}
	
	mov r3, #0          	 @R3 = 0 (fib(0))
	mov r4, #1	    	 @R4 = 1 (fib(1))
	adds r2, r0, #4294967295 @R2 = R0 - 1
	bgt .Loop	    	 @If (R2 > 1) goto .Loop
			    	 @else return R0
	pop {r2, r3, r4, r5, pc}

.Loop:
	add r5, r3, r4      	 @R5 = R3 + R4
	mov r3, r4	    	 @R3 = R4
	mov r4, r5	    	 @R4 = R5
	adds r2, r2, #4294967295 @R2 = R2 - 1
	cmp r2, #0	    	 @If (R2 > 0) goto .Loop
	bne .Loop	    	 @else return R5
	mov r0, r5

	pop {r2, r3, r4, r5, pc}

	.size fibonacci, .-fibonacci
	.end
