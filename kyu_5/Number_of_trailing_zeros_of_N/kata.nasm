global  zeros
section .text
; <----- unsigned long long zeros(unsigned long long num) ----->
zeros:
    push rbp
    mov  rbp,           rsp
    sub  rsp,           8   ; Reserve space in the stack
    mov  dword [rbp-4], 5   ; i = 5
    xor  rcx,           rcx ; count = 0
    mov  rax,           rdi ; n = argument

    jz   .L2      ; If n is 0, jump to the end
.L3:
    cmp dword [rbp-4], eax ; Compare i with the lower part of n
    ja  .L2                ; If i > n, exit the loop
    mov rdx,           0   ; Clear rdx to prepare for division
    div dword [rbp-4]      ; Divide n by i
    mov rdx,           rax
    xor rax,           rax ; Clear the upper part of rax
    div dword [rbp-4]      ; Divide n by i
    
    add rcx,     rax           ; count += (n // i)
    mov eax,     [rbp-4]
    lea eax,     [eax + eax*4] ; eax = eax + eax*4 = eax*5
    mov [rbp-4], eax
    mov rax,     rdi           ; Restore n in rax
    jmp .L3
.L2:
    mov   rax, rcx
    leave          ; equivalent to: mov rsp, rbp / pop rbp
    ret
; ---------> end of zeros <---------