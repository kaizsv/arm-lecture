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
	push {r4, r5, r6, r7, lr}
	
	mov r5, #0          	 @R5 = 0 (fib(0))
	mov r6, #1	    	 @R6 = 1 (fib(1))
	adds r4, r0, #4294967295 @R4 = R0 - 1
	bgt .Loop	    	 @If (R4 > 1) goto .Loop
			    	 @else return R0

	pop {r4, r5, r6, r7, pc}

.Loop:
	add r7, r5, r6      	 @R7 = R5 + R6
	mov r5, r6	    	 @R5 = R6
	mov r6, r7	    	 @R6 = R7
	adds r4, r4, #4294967295 @R4 = R4 - 1
	bgt .Loop	    	 @If (R4 >= 0) goto .Loop
	mov r0, r7		 @else return R7

	pop {r4, r5, r6, r7, pc}

	.size fibonacci, .-fibonacci
	.end
