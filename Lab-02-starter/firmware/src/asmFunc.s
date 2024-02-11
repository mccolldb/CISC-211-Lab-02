/*** asmFunc.s   ***/

#include <xc.h>

/* Tell the assembler that what follows is in data memory    */
.data
.align
 
.global nameStr
.type nameStr,%gnu_unique_object
/* create a string */
    
/*** STUDENTS: HINT: this is the string that the C code prints out!  **/
nameStr: .asciz "Hello. My name is David McColl."  
 
/* initialize a global variable that C can access to print the nameStr */
.global nameStrPtr
.type nameStrPtr,%gnu_unique_object
nameStrPtr: .word nameStr   /* Assign the mem loc of nameStr to nameSrPtr */
 
/* Tell the assembler that what follows is in instruction memory    */
.text
.align

/* Tell the assembler to allow both 16b and 32b extended Thumb instructions */
.syntax unified
.cpu cortex-m4
.thumb
    
/********************************************************************
function name: asmFunc
function description:
     output = asmFunc ( input1, input2 )
     
where:
     input1:  an integer value passed in from the C program
     input2:  an integer value passed in from the C program
     output: the integer value returned to the C function
     
     function description: The C call passes in the two values to be summed
                           in registers 0 and 1 (r0 and r1).
                           asmFunc adds the two integer values together
                           and places the result in r0.
     
     notes:
        None
          
********************************************************************/    
.global asmFunc
.type asmFunc,%function
.thumb_func
asmFunc:   
    push {r4-r7,LR} /* save the caller's registers */

    /*** STUDENTS: Place your code BELOW this line!!! **************/
    ADD R0,R0,R1  /* add inputs (R0,R1) --> output R0 */    
    /*** STUDENTS: Place your code ABOVE this line!!! **************/
    
    pop {r4-r7,PC} /* restore the caller's registers  and return */
   
/**********************************************************************/   
.end  /* The assembler will not process anything after this directive!!! */

 dis assemble resulting ELF file: cd CISC-211-Lab-02/Lab-02-starter/hex 
 arm-none-eabi-objdump -d Lab-02-starter.X.debug.elf  > Lab-02-starter.X.debug.dis

00001e74 <asmFunc>:
    1e74:	b5f0      	push	{r4, r5, r6, r7, lr}
    1e76:	4408      	add	r0, r1
    1e78:	bdf0      	pop	{r4, r5, r6, r7, pc}
    1e7a:	bf00      	nop


