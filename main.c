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

int		ft_strlen(char* str);
int		ft_write(int fd, char *buf, int len);
int		ft_read(int fd, char *buf, int len);
int		ft_strcmp(char *str1, char *str2);	
char	*ft_strcpy(char *orig, char *dest);

int main(void)
{
	char	*str;
	char	*str2;
	char	*read = calloc(10, 1);
	int		ret;

	str = "Coucou\n";
	str2 = "Coukou\n";
	printf("Size of \"Coucou\\n\" is %d\n", ft_strlen(str));
	printf("Size of \"\" is %d\n-----------------\n", ft_strlen(""));

	printf("Comp of \"Coucou\\n\" and \"Coucou\\n\" is %d\n", ft_strcmp(str, str));
	printf("Comp of \"Coucou\\n\" and \"Coukou\\n\" is %d\n", ft_strcmp(str, str2));
	printf("Comp of \"Coukou\\n\" and \"Coucou\\n\" is %d\n", ft_strcmp(str2, str));
	printf("Comp of \"\" and \"Coukou\\n\" is %d\n", ft_strcmp("", str2));
	printf("Comp of \"Coukou\\n\" and \"\" is %d\n-------------------\n", ft_strcmp(str2, ""));

	printf("Result of ft_strcpy(\"Coucou\\n\", str2) :%s-----------------\n", ft_strcpy(str, str2));

	printf("Return value of ft_write(1, \"Coucou\\n\", 7) is %d\n", ft_write(1, str, 7));
	perror("The sys_write syscall encountered");
	printf("Return value of ft_write(-1, \"Coucou\\n\", 7) is %d\n", ft_write(-1, str, 7));
	perror("The sys_write syscall encountered");

	errno = 0;
	ft_write(1, "-----------------\n", 18);
	ft_write(1, "Reading 9 characters from stdin :", 33);
	ret = ft_read(0, read, 5);
	printf("\nReturned value is %d and edited buffer is now %s", ret, read);
	perror("The sys_read syscall encountered");
	ft_write(1, "\nReading from invalid input :", 29);
	ret = ft_read(-1, read, 5);
	printf("\nReturned value is %d\n", ret);
	perror("The sys_read syscall encountered");
	free(read);
	return (0);
}