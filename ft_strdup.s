# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/06 14:17:09 by rgilles           #+#    #+#              #
#    Updated: 2021/04/06 14:17:12 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_strdup

section .text

extern malloc
extern ft_strlen
extern ft_strcpy

ft_strdup:
	mov		rbx, rdi
	call 	ft_strlen
	mov		rdi, rax
	inc		rdi
	call	malloc
	cmp		rax, 0
	jz		end
	mov		rdi, rax
	mov		rsi, rbx
	call	ft_strcpy
end:
	ret