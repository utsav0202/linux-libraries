#include <stdio.h>
#include "lib.h"

int main()
{
	int a, b;

	printf("enter a: ");
	scanf("%d", &a);
	printf("enter b: ");
	scanf("%d", &b);
	printf("a + b : %d\n", lib_add(a, b));
	return 0;
}
