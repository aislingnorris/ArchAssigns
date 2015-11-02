option casemap:none   ; case sensitive
extern printf: near

;
;t2.asm
;

.data
public g      ; make sure variable is exported
g QWORD 256   ; global var g = 256
.code

public p      ; make sure function name is exported
p:  lea rax, [rcx + rdx]  ; rax = i + j
      shl rax, 2    ; rax = k << 2
dec rax   ; k--
ret     ; return rax

public q      ; make sure function name is exported
q:  neg rcx   ; rax = -i
mov rdx, rcx    ; rdx = -i
mov rcx, [g]    ; rcx = g
sub rsp, 32   ; allocating shadow space
call p      ; p(g, -i)
add rsp, 32   ; getting rid shadow space
ret     ; return rax


public f
f:  cmp rcx, 0    ; if(n < 0)
jle f_a1      ; branch
push rdx    ; store n on stack
mov rdx, rcx    ; rcx = n
dec rcx     ; n - 1
sub rsp, 32   ; allocating shadow space in stack
call f      ;
add rsp, 32   ; getting rid of shadow space in stack
imul rax, rdx   ; n* f(n-1)
pop rdx   ; restore n
ret     ; return rax
f_a1: mov rax, 1    ; rax = 1
ret     ; return rax


fxp5    db      'a = %I64d b = %I64d c = %I64d d = %I64d e = %I64d sum = %I64d', 0AH, 00H 

public xp5
xp5:  lea rax, [rcx + rdx]  ; sum = a + b
add rax, r8   ; sum += c
add rax, r9   ; sum += d
add rax, [rsp + 40] ; sum += e
push rax    ; store sum on stack as param
push [rsp + 48] ; store e (taking last push to stack into consideration) as param
push r9   ; store d on stack as param
mov r9, r8    ; move c over, to allow printing string in rcx
mov r8, rdx   ; move b over
mov rdx, rcx    ; move a over
lea rcx, fxp5   ; move string address into rcx
sub rsp, 32   ; allocating shadow space
call printf
add rsp, 48   ; shadow space & param gone, sum in last place in the stack
pop rax   ; restore sum
ret     ; return rax

END
