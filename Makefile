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

SRCS	=	ft_strlen.s
SRCS_B	=

INCL	=	./
MAIN	=	main.c
MAIN_B	=	main_bonus.c

OBJS	=	${SRCS:.s=.o}
OBJS_B	=	$(SRCS:.s=.o) ${SRCS_B:.s=.o}

CC		=	gcc
CFLAGS	=	-no-pie

.s.o:
		nasm -i $(INCL) -o ${<:.s=.o} $<

all:		$(NAME)

$(NAME):	$(OBJS)
		ar -vcrs $(NAME) $(OBJS)

bonus:		$(OBJS_B)
		ar -vcrs $(NAME) $(OBJS_B)

test:		$(NAME)
		gcc $(CFLAGS) $(NAME) $(MAIN) -o test

test_bonus:	$(NAME)
		gcc $(CFLAGS) $(NAME) $(MAIN_B) -o test_bonus

clean:
		rm -f *.o

fclean:		clean
		rm -f $(NAME) test test_bonus

re:			fclean $(NAME)

.PHONY : all clean fclean