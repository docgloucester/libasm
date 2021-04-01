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
#include <errno.h>

int	ft_strlen(char* str);
int	ft_write(int fd, char *buf, int len);

int main(void)
{
	char *str;

	str = "Coucou\n";
	printf("Size of \"Coucou\\n\" is %d\n", ft_strlen(str));
	printf("Return value of ft_write(1, \"Coucou\\n\", 7) is %d\n", ft_write(-1, str, 7));
	perror("The sys_write syscall encountered");
	return(0);
}