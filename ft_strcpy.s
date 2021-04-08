# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 21:20:42 by rgilles           #+#    #+#              #
#    Updated: 2021/04/06 21:20:43 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strcpy

section .text

ft_strcpy:
	mov		rax, rdi

loop:
	cmp		byte [rsi], 0
	je		return
	mov		al, byte [rsi]
	mov		[rdi], al
	inc		rsi
	inc		rdi
	jmp		loop

return:

	ret
