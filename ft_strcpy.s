global ft_strcpy

section .text

ft_strcpy:
	mov		rax, rsi
	mov		rbx, 0

loop:
	cmp		byte [rdi + rbx], 0
	je		return
	mov		[rsi + rbx], [rdi + rbx]
	add		rbx, 1
	jmp	loop

return:
	ret