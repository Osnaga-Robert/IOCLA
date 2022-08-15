%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    push ecx
    mov ecx, eax
    pop eax

loop_for:

    xor edx,edx                 ;stergem tot ce putem din edx,edi,esi
    xor edi,edi
    xor esi,esi
    mov dl,[ebx + ecx * 4 - 4]  ;luam ultimul element din vector
    push ecx                    ;mutam elementul ecx pe stiva panetru a ne puteam folosi de registru
    mov edi,edx                 ;mutam in edi primul element din vector
    xor edx,edx                 ;stergem din edx si ecx tot ce putem
    xor ecx,ecx
    mov edx, 1                  ;ii atribuim lui edx 1
    mov ecx, edi
    xor edx,edx
    mov edi, 1                  ;ii atribuim lui edi 1
    mov esi, ecx                ;ii atribuim lui esi elementul din vector
    mov dl, 2                   ;ii atribuim lui edx 2
    xor ecx, ecx
    mov cl, 2                   ;ii atribuim lui ecx 2

back:

    cmp esi, 0                  ;daca numarul din vector este 0 atunci numarul este pp
    je da                       ;de accea vom sari direct la da
    cmp esi,edi                 ;daca se depaseste valoarea lui esi atunci automatul nr nu este prim
    jb nu
    cmp esi, 1                  ;daca numarul din vecotr este 1 atunci numarul este pp
    je da
    cmp edi,ecx                 ;ne formam patratul unui numar
    jne form_squared
    cmp edi,ecx                 ;in cazul in care edi si ecx sunt egale inseamna ca am format patratul perfect
    je compare

form_squared:

    add dl, cl                  ;adaugam aceeasi valoare
    add edi, 1                  ;incrementam in edi valoarea 1 pentru a fla numarul de pasi
    jmp back                    ;repetam rationamentul pana formam numarul dorit

compare:

    cmp esi, edx                ;comparam patratul cu numarul din vector
    je da                       ;daca sunt egale atunci este pp
    add cl, 1                   ;in caz in care nu s-a gasit atunci se trece la urmatorul numar
    mov dl, cl                  ;mutam urmatoare valoare pentru a afla urmatorul pp
    mov edi, 1
    jmp back                    ;sarim inapoi

da:

    xor esi,esi                 ;in cazul in care este pp atunci vom muta in esi raspunsul de 1
    mov esi, 1
    jmp final                   ;ajungem la final

nu:

    xor esi,esi                 ;in cazul in care nu este pp atunci vom muta in esi raspunsul (0)
    mov esi, 0
    jmp final                   ;ajungem la final

final:

    pop ecx                     ;luam inapoi pasul in care ne aflam
    mov [eax + 4 * ecx - 4],esi ;mutam in vectorul eax elementele de 0 sau 1

loop loop_for

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret

    ;; DO NOT MODIFY