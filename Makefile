# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/30 13:48:53 by rgilles           #+#    #+#              #
#    Updated: 2021/03/30 13:48:56 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libasm.a

SRCS	=	ft_strlen.s ft_write.s ft_read.s ft_strcmp.s ft_strcpy.s
SRCS_B	=

INCL	=	./
MAIN	=	main.c
MAIN_B	=	main_bonus.c

OBJS	=	${SRCS:.s=.o}
OBJS_B	=	$(SRCS:.s=.o) ${SRCS_B:.s=.o}

CC		=	/usr/bin/clang
CFLAGS	=	-Wall -Wextra -Werror

.s.o:
		nasm -felf64 -g -i $(INCL) -o ${<:.s=.o} $<

all:		$(NAME)

$(NAME):	$(OBJS)
		ar -vcrs $(NAME) $(OBJS)

bonus:		$(OBJS_B)
		ar -vcrs $(NAME) $(OBJS_B)

test:		$(NAME) $(MAIN)
		$(CC) $(CFLAGS) $(MAIN) $(NAME) -o test

test_bonus:	$(NAME)
		$(CC) $(CFLAGS) $(MAIN_B) $(NAME) -o test_bonus

clean:
		rm -f *.o

fclean:		clean
		rm -f $(NAME) test test_bonus

re:			fclean $(NAME)

.PHONY : all clean fclean


#############################
#	Stack shifting routine	#
#############################
# func:
# 	push	rbp				; Store the current stack frame
# 	mov		rbp, rsp		; Preserve RSP into RBP for argument references
# 	and		rsp, 0xfffffff0	; Align the stack to allow SIMD instructions
# 	mov		rax, [rbp+16]	; Move the contents of RBP+16 into RAX
# 							; [RBP] should be the saved 64 bit RBP.
# 							; [RBP+8] should be the 64 bit RIP (return address).
# 							; [RBP+16] should be the pushed parameter.
# 	...						; DO COOL STUFF
# 	mov		rsp, rbp		; Restore the stack and rbp
# 	pop		rbp
# 	ret

# main:
# 	push	0x08
# 	call	func
# 	pop		rbx				; Clean up the stack