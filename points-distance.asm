%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .data
    pointArray: times point_size * 2  db 0

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha
    ;; Your code ends here
    
    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY

    ;; Your code starts here

    xor edx,edx                 ;stergem tot ce putem din edx
    xor ecx,ecx                 ;stergem tot ce putem din ecx
    mov cl,[ebx + point.x]      ;mutam in ecx valoarea lui x din primul element din vector
    mov dl,[ebx + 4 + point.x]  ;mutam in edx valoarea lui x din al doilea element din vector
    cmp cl, dl                  ;comparam pentru a afla daca se afla pe aceeasi axa
    je equal                    ;in cazul in care sunt ne mutam pe linia 39
    cmp cl, dl                  ;comparam pentru a vedea care este mai mare
    jl switch                   ;in cazul in care x(0) este mai mic decat x(1)
    jmp finish                  ;in caz contrar,sarim la final

equal:

    mov dl, [ebx + point.y]     ;acum facem acelasi lucru dar de data asta pentru y
    mov cl, [ebx + 4 + point.y] ;
    cmp cl,dl                   ;comparam pentru a vedea care este mai mare
    jl switch                   ;in cazul in care y(0) este mai mic decat y(1)
    sub cl, dl
    jmp finish

switch: 

    sub dl,cl                   ;scadem in al mare termenul mic
    mov cl,dl                   ;mutam termenul in ecx
    jmp finish                  ;ajungem la final



finish :

    mov byte [eax],cl           ;mutam rezultatul in registrul dorit

    ;; DO NOT MODIFY

    popa
    leave
    ret

    ;; DO NOT MODIFY

