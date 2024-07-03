SENHA_MAX equ 12

section .text
    global le, escreve, compara

le:
    ; Lê uma string do teclado
    mov eax, 3
    mov ebx, 0
    mov edx, SENHA_MAX
    int 0x80
    ret

escreve:
    ; Imprime uma string na tela
    mov eax, 4
    mov ebx, 1
    int 0x80
    ret

compara:
    ; Compara duas strings
    mov ecx, SENHA_MAX
compara_loop:
    mov al, [esi]
    mov bl, [edi]
    cmp al, bl
    jne compara_diferente
    inc esi
    inc edi
    loop compara_loop
    mov eax, 1   ; Se todas as comparações forem iguais, retorna 1
    ret

compara_diferente:
    mov eax, 0   ; Se encontrar alguma diferença, retorna 0
    ret
