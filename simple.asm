%include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step
   
    ;; DO NOT MODIFY
    ;; Your code starts here

copy:

    mov bl,[esi]    ;mutam in bl primul element din vectorul esi
    add bl, dl      ;ii adaugam cheia
    cmp bl, 0x5A    ;veerificam daca trece de Z
    jg modify       ;in cazul in care trece vom ajunge la linia 38

here:

    mov [edi],bl    ;punem in edi litera modifica conform cerintei
    inc esi         ;incrementam cu 1 pentru a trece la urmatoarea litera
    inc edi         ;incrementam cu 1 pentru a nu suprascrie rezultatele

loop copy

    jmp final

modify:             

    sub bl, 26      ;scadem 26 in cazul in care trece de Z
    jmp here        ;sarim inapoi in program pentru a trece la urmatoarea litera

final:
    
    ;; Your code ends here
    ;; DO NOT MODIFY

    popa
    leave
    ret

    ;; DO NOT MODIFY

