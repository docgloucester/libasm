# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 14:17:41 by rgilles           #+#    #+#              #
#    Updated: 2021/04/06 14:17:43 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strcmp

section .text

ft_strcmp:
	mov		rbx, 0

loop:
	movzx	rax, byte [rdi + rbx]
	movzx	rcx, byte [rsi + rbx]
	cmp		rax, rcx
	jne		return_diff
	cmp		rax, 0
	je		return_nodiff
	add		rbx, 1
	jmp		loop
return_diff:
	sub		rax, rcx
	ret
return_nodiff:
	ret