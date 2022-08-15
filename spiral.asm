%include "../include/io.mac"

section .text
    global spiral
    extern printf

; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)

    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    xor edx,edx
    xor esi,esi
    xor edi,edi
    mov edx,1
reset:
    mov di,1
linie_dreapta:
    xor esi,esi
    mov esi,[ebx]
    add esi,[ecx + 4 *(edx - 1)]
    ;PRINTF32`%c\n\x0`,esi
    add esi,edi
    mov [ebx],esi
    inc ebx
    inc dl
    inc di
    ;PRINTF32`%u\n\x0`,edi
    ;PRINTF32`\n\x0`
    cmp eax,edi
    jge linie_dreapta
    xor edi,edi
    mov di,1
    sub dl,1
    cmp edi,eax
    je final
coloana_jos:
    xor esi,esi
    add dl,al
    mov esi,[ebx]
    add esi,[ecx + 4 *(edx - 1)]
    ;PRINTF32`%c\n\x0`,esi
    mov [ebx],esi
    inc ebx
    inc di
    cmp eax,edi
    jg coloana_jos
    xor di,di
    mov edi,eax
    sub di,1
    cmp edi,eax
    je final
    ;sub dl,1
    ;PRINTF32`%u\n\x0`,edx
linie_stanga:
    xor esi,esi
    sub dl,1
    mov esi,[ebx]
    add esi,[ecx + 4 * (edx - 1)]
    mov [ebx],esi
    inc ebx
    sub di,1
    cmp di, 0
    jg linie_stanga
    xor di,di
    mov di,2
    cmp edi,eax
    je final
    ;add edx, 1
    ;PRINTF32`%d\n\x0`,edx
linie_sus:
    xor esi,esi
    ;PRINTF32`%u\n\x0`,edx
    sub dl,al
    mov esi, [ebx]
    add esi,[ecx + 4 *(edx - 1)]
    ;PRINTF32`%c\n\x0`,esi
    mov [ebx],esi
    inc ebx
    inc di
    cmp eax,edi
    jg linie_sus
    add edx, 1
    sub eax,1
    ;PRINTF32`%u\n\x0`,edx
    cmp eax,0
    jg reset
    ;PRINTF32`%u\n\x0`,eax
    jmp final
    
final:
    ;PRINTF32`%c\n\x0`,[ebx - 1]
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
