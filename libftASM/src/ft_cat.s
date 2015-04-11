
; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_cat.s                                        :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: mbarbari <mbarbari@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2015/04/04 17:34:44 by mbarbari          #+#    #+#              #
;    Updated: 2015/04/04 17:34:44 by mbarbari         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

; rdi, rsi, rdx
extern ft_puts
extern ft_bzero
global ft_cat

ft_cat:
	enter 4096, 0
	mov r12, rdi
	mov rsi, rsp    ; buffer

.read:
	mov rax, 0x2000003
	mov rdi, r12      ; fd stdin
	mov rdx, 4095   ; n read
	syscall
	jc .endKO
	mov r13, rax
	mov [rsi + rax], byte 0

.write:
	mov rdi,1     ; on transfert le buffer
	mov rdx, rax    ; n caractere a ecrire
	mov rax, 0x2000004
	syscall

.ifout:
	cmp r13, 0
	jle .end
	jmp .read

.end:
	mov rax, 0
	leave
	ret

.endKO:
	mov rax, 1
	leave
	ret
