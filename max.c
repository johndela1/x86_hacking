#include <stdio.h>

int nums[] = {1,4,5,6,4,3,0};

int main()
{
	int max;
	int *i;
	
	i = nums;
	max = *i;
	while(*i++)
		if (*i > max)
			max = *i;
	return max;
}
