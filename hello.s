# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    hello.s                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/03/30 15:38:43 by rgilles           #+#    #+#              #
#    Updated: 2021/03/30 15:38:44 by rgilles          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		global _start



		section .text
_start:
;
;       op      dst,  src
;
                                ;
                                ; Call write(2) syscall:
                                ;       ssize_t write(int fd, const void *buf, size_t count)
                                ;
        mov     rdx, strLen     ; Arg three: the length of the string
        mov     rcx, str        ; Arg two: the address of the string
        mov     rbx, 1          ; Arg one: file descriptor, in this case stdout
        mov     rax, 4          ; Syscall number, in this case the write(2) syscall: 
        int     0x80            ; Interrupt 0x80        

                                ;
                                ; Call exit(3) syscall
                                ;       void exit(int status)
                                ;
        mov     rbx, 0          ; Arg one: the status
        mov     rax, 1          ; Syscall number:
        int     0x80



        section .data
str:     db 'Hello, world!',0xA
strLen:  equ $-str