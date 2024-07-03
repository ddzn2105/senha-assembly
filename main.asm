section .data
    pedido db "Digite sua senha> "
    PEDIDO_TAM equ $ - pedido
    pedido1 db "Digite denovo> "
    PEDIDO1_TAM equ $ - pedido1
    msg db "senha alterada com sucesso!"
    msg_tam equ $ - msg
    msg1 db "senha inconsistente"
    msg_tam1 equ $ - msg1

SENHA_MAX equ 12

section .bss
    buf resb SENHA_MAX
    buf1 resb SENHA_MAX

section .text
    global _start
    extern le, escreve, compara

_start:
    ; Bloco 1: Solicita a primeira senha
    mov ecx, pedido
    mov edx, PEDIDO_TAM
    call escreve

    ; Bloco 2: Lê a primeira senha
    mov ecx, buf
    call le

    ; Bloco 3: Solicita a segunda senha
    mov ecx, pedido1
    mov edx, PEDIDO1_TAM
    call escreve

    ; Bloco 4: Lê a segunda senha
    mov ecx, buf1
    call le

    ; Bloco 5: Compara as senhas
    mov esi, buf
    mov edi, buf1
    call compara
    cmp eax, 1
    jne senhas_inconsistentes

    ; Bloco 6: Mensagem de sucesso
    mov ecx, msg
    mov edx, msg_tam
    call escreve
    jmp fim

senhas_inconsistentes:
    ; Bloco 7: Mensagem de erro
    mov ecx, msg1
    mov edx, msg_tam1
    call escreve

fim:
    ; Termina o programa
    mov eax, 1
    mov ebx, 0
    int 0x80
