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
	push {r3, r4, r5, r6, lr}
	
	mov r3, #0          	 @R3 = 0 (fib(0))
	mov r4, #1	    	 @R4 = 1 (fib(1))
	adds r6, r0, #4294967295 @R6 = R0 - 1
	bgt .Loop	    	 @If (R6 > 1) goto .Loop
			    	 @else return R0

	pop {r3, r4, r5, r6, pc}

.Loop:
	add r5, r3, r4      	 @R5 = R3 + R4
	mov r3, r4	    	 @R3 = R4
	mov r4, r5	    	 @R4 = R5
	adds r6, r6, #4294967295 @R6 = R6 - 1
	bgt .Loop	    	 @If (R6 >= 0) goto .Loop
	mov r0, r5		 @else return R5

	pop {r3, r4, r5, r6, pc}

	.size fibonacci, .-fibonacci
	.end
