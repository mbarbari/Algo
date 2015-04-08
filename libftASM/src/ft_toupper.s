; **************************************************************************** #
;                                                                              #
;                                                         :::      ::::::::    #
;    ft_tolower.s                                       :+:      :+:    :+:    #
;                                                     +:+ +:+         +:+      #
;    By: mbarbari <mbarbari@student.42.fr>          +#+  +:+       +#+         #
;                                                 +#+#+#+#+#+   +#+            #
;    Created: 2015/04/03 15:43:26 by mbarbari          #+#    #+#              #
;    Updated: 2015/04/03 15:43:26 by mbarbari         ###   ########.fr        #
;                                                                              #
; **************************************************************************** #

section .text
	global ft_toupper

ft_toupper:
	enter 0, 0
	cmp rdi, 'a'
	jl .finishKO
	cmp rdi, 'z'
	jg .finishKO

.finishOK:
	mov rax, rdi
	sub rax, 32
	leave
	ret

.finishKO:
	mov rax, rdi
	leave
	ret
