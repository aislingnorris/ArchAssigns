.486                    ; create 32bit code
.model flat, C                ; 32bit memory model
option casemap:none           ; case sensitive

;
;t1.asm
;

.data
public g         ; make sure variable is exported
g DWORD 256      ; global var g = 256
.code

public p                       ; make sure function name is exported
p:      push ebp             ; push fp
    mov ebp, esp       ; move sp into fp
    sub esp, 4     ; SP -= 4
    mov eax, [ebp+8]     ; eax = i  
    add eax, [ebp+12]    ; eax += j
    mov [ebp-4], eax     ; k = i + j
    shl eax, 2             ; eax = k << 2
    dec eax              ; k--
    mov esp, ebp         ; restore sp
    pop ebp              ; restore fp
    ret                    ; return eax

public q                   ; make sure function name is exported
q:    push ebp             ; push fp
    mov ebp, esp         ; move sp into fp
    mov eax, [ebp+8]     ; eax = i
    neg eax              ; eax = -i
    push eax             ; push eax to stack
    push [g]             ; push g to stack
    call p                 ; p(g, -i)
    add esp, 8           ; pop params
    mov esp, ebp         ; restore sp
    pop ebp    ; restore fp
    ret                    ; return eax



public f
f:      push ebp             ; push fp
    mov ebp, esp         ; move sp into fp
    mov eax, [ebp+8]     ; eax = n
    cmp eax, 0     ; if(n<0)
    jle f_a1         ; branch
    mov ecx, eax       ; ebx = n
    dec ecx    ; n -1
    push ecx           ; passings n-1 to f
    call f                 ;
    add esp, 4           ; pop param
    imul eax, [ebp+8]    ; n* f(n-1)
    mov esp, ebp       ; restore stack pointer
    pop ebp    ; restore ebp
    ret      ; ret eax
f_a1:   mov eax, 1     ; eax = 1
    mov esp, ebp       ; restore sp
    pop ebp    ; restore fp
    ret      ; return eax

    END
