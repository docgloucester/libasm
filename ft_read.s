# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.c                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/02 18:01:30 by rgilles           #+#    #+#              #
#    Updated: 2021/04/02 18:04:41 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global ft_read
extern	__errno_location

section .text

ft_read:
	mov		rax, 0
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
