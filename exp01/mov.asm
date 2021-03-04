; Experiments with function call 
global Start

section .text
Start:
    mov rdi, 1
    mov rsi, 1
    call foo ;if return value it is stored in %rax
    ret
foo:
 push rbx		;save registers if needed
 push r12
 push r13
 sub rsp, 24 	;allocate 24 bytes of space on the stack
    
 add rax, rdi
 add rax, rsi

 add rsp, 24
 pop r13
 pop r12
 pop rbx
 ret 
