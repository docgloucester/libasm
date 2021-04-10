# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/01 13:53:19 by rgilles           #+#    #+#              #
#    Updated: 2021/04/01 14:45:48 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_write
extern	__errno_location

section .text

ft_write:
	mov		rax, 1
	mov		rbx, rdi
	mov		rcx, rsi ; 3d argument is already in rdx
	syscall
	cmp		rax, 0
	jl		error
	ret

error:
	mov		rdx, rax
	neg		rdx
	call	__errno_location
	mov		[rax], rdx
	mov		rax, -1
	ret
	