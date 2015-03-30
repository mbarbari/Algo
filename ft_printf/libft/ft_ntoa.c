/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_htoa.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mbarbari <mbarbari@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/01/19 21:46:43 by mbarbari          #+#    #+#             */
/*   Updated: 2015/02/24 15:18:14 by mbarbari         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <libft.h>
#include <stdio.h>

static int	decompte_ntoa(uintmax_t x, int len)
{
	int	cmp;

	cmp = 0;
	while (x > 0)
	{
		x /= len;
		cmp++;
	}
	return (cmp);
}

char		*ft_ntoa(uintmax_t hex, char *base)
{
	int			cmp;
	uintmax_t	x;
	char		*str;
	int			len;

	x = hex;
	if ((len = ft_strlen(base)) <= 1)
		return (NULL);
	if (hex == 0)
		return (ft_strdup("0"));
	cmp = decompte_ntoa(x, len);
	if (!(str = malloc(cmp + 1)))
		return (NULL);
	str[cmp] = '\0';
	cmp--;
	while (cmp >= 0)
	{
		str[cmp--] = base[(hex % len)];
		hex /= len;
	}
	return (str);
}