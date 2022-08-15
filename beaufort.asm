%include "../include/io.mac"

section .text
    global beaufort
    extern printf

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE

    push esi                ;incercam sa ne folosim de cat mai multe registre posibile
    xor edi,edi             ;eliminam tot ce acem din esi si edi deoarece nu avem nevoie
    xor esi,esi
    mov esi, 0              ;punem la inceput atat in edi cat si in esi 0 pentru a stii in ce pozitie ne aflam in vectorii ebx si edx
    mov edi,0

haide:

    push eax                ;mutam eax pe stiva
    mov al,[ebx + edi ]     ;mutam in al elemeentele din vectorul ebx pe rand
    mov ah,[edx + esi ]     ;mutam in ah elementele din vecotul edx pe rand
    push ecx                ;mutam ecx pe stiva
    xor ecx,ecx
    mov cl,ah               ;mutam in ecx elementele din vecotul edx
    xor ah,ah               ;eliminam tot ce aveam in ah
    cmp al, cl              ;comparam al si cl pentru a afla care este mai mare
    jbe caz1                ;cazul in care caracterul din vector este mai mic decat cheia
    cmp al,cl
    jg caz2                 ;cazul complementar

caz1:    

    sub cl,al               ;vom face diferenta dintre al mare si al mic
    add cl,65               ;adunam 65 deoarece 65 reprezinta elementul A
    jmp final               ;ajungem la final

caz2:

    sub al,cl               ;cazul complementar in care scadem din al mare pe al mic
    xor cl,cl
    mov cl, 26              ;mutam 26 deoare exista 26 de litere mari in alfabetul englez
    sub cl,al               ;scadem pe al in cl pentru a afla pe ce pozitie ar trebui sa fie litera noastra dupa algoritm
    add cl, 65              ;adunam din nou 65
    jmp final               ;ajungem la final

final:

    mov [ebx + edi],cl      ;inlocuim in vectorul ebx elementul nou dupa aplicarea cheii Beaufort
    add edi, 1              ;trecem la urmatoarele elemente deci adaugam unu atat pentru edi cat si pentru esi
    add esi, 1
    pop ecx                 ;recuperam ecx din stiva
    pop eax                 ;recuperam eax din stiva
    cmp edi,eax             ;comparam eax si edi pentru a afla daca am ajung la sfarsitul vectorului, caz in care ne oprim
    je gata                 
    cmp esi,ecx             ;comparam esi si ecx pentru a afla daca am ajung ls sfarsitul cheii, caz in care resetam sirul
    je reset
    cmp edi,eax
    jne haide

reset:

    mov esi,0               ;ii atribuim lui esi 0 pentru a ajunge din nou la inceput
    jmp haide               ;reluam ciclul

gata:

    xor ecx,ecx             ;stergem tot din toate registrele inafara de eax si ebx
    xor edx,edx
    pop esi
    mov ecx, eax            ;mutam in ecx ce se afla in eax deoare dorim sa construim un loop in care sa mutam elementele lui ebx in esi
    xor eax,eax

mutare:                     ;loop prin care mutam elementele din ebx in esi

    mov dl , [ebx]
    mov [esi] , edx
    inc ebx
    inc esi

loop mutare



    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
