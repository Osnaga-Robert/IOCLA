%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances

    ;; DO NOT MODIFY
    ;; Your code starts here

    sub ecx, 1                              ;scadem de la inceput din ecx 1 deoarece vom dori sa facem in loop, iar in vecotul final exista n-1 elemente

lenght:

    xor edx,edx                             ;stergem tot ce avem in edx
    xor esi,esi                             ;stergem tot din esi
    xor edi,edi                             ;stergem tot din edi
    xor si,si
    xor di,di
    mov di,[eax + ecx * 4 +  point.x]       ;mutam in edi ultimul element din sir (suam sirul de la coada la cap)
    mov si,[eax + ecx * 4 - 4 + point.x]    ;mutam in esi pen-ultimul element din sir
    cmp si, di                              ;comparam exact ca la 2a
    je equal                                ;daca se afla pe axa Ox atunci ne vom folosi de coordonatele lui Oy 
    cmp di, si                              ;observam care dintre coordonate este mai mare
    jl switch                               ;schimbam in cazul in care edi este mai mic ca esi
    sub di,si                               ;calculam distanta in caz contrar
    mov si,di                               ;mutam maximul in esi
    jmp finish                              ;ajunge, la final

equal:

    xor di,di                               ;eliminam tot ce acem din esi si edi
    xor si,si
    mov di, [eax + ecx * 4 + point.y]       ;mutam in edi si esi coordonatele lui y
    mov si, [eax + ecx * 4 - 4 + point.y]
    cmp di,si                               ;aflam care este mai mare
    jl switch                               ;schimbam in cazul in care edi este mai mic ca esi
    sub di, si                              ;aflam distanta in caz contrat
    mov si,di                               ;mutam maximul in esi
    jmp finish                              ;ajungem la final

switch:

    sub si,di                               ;facem diferenta dintre elementul mare si elementul mic
    mov di,si
    jmp finish                              ;ajungem la final  

finish :

    mov edx, edi                            ;mutam in edx rezultatul
    mov [ebx + 4 * ecx - 4],edx             ;mutam elementul in vector

loop lenght                                 ;facem acest loop ne n-1 deoarece daca in vectorul initial avem 5 puncte atunci vor exita 4 distante

    ;; DO NOT MODIFY

    popa
    leave
    ret

    ;; DO NOT MODIFY