/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rgilles <rgilles@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/03/30 15:28:16 by rgilles           #+#    #+#             */
/*   Updated: 2021/03/30 15:28:17 by rgilles          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

int	ft_strlen(char* str);
int	ft_write(int fd, char *buf, int len);
int	ft_read(int fd, char *buf, int len);

int main(void)
{
	char	*str;
	char	*read = malloc(6);
	int		ret;

	str = "Coucou\n";
	read[5] = 0;
	printf("Size of \"Coucou\\n\" is %d\n-----------------\n", ft_strlen(str));

	printf("Return value of ft_write(1, \"Coucou\\n\", 7) is %d\n", ft_write(1, str, 7));
	perror("The sys_write syscall encountered");
	printf("Return value of ft_write(-1, \"Coucou\\n\", 7) is %d\n", ft_write(-1, str, 7));
	perror("The sys_write syscall encountered");

	errno = 0;
	ft_write(1, "-----------------\n", 18);
	ft_write(1, "Reading 5 characters from stdin :", 33);
	ret = ft_read(0, read, 5);
	printf("\nReturned value is %d and edited buffer is now %s", ret, read);
	perror("The sys_read syscall encountered");
	ft_write(1, "\nReading from invalid input :", 29);
	ret = ft_read(-1, read, 5);
	printf("\nReturned value is %d", ret);
	perror("The sys_read syscall encountered");
	return(0);
}