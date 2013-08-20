#include <stdio.h>
#include "lib.h"

int main(int argc, char** argv)
{
	int a;
	int b;

	printf("Enter a: ");
	scanf("%d", &a);
	printf("Enter b: ");
	scanf("%d", &b);
	printf("a + b : %d\n", lib_add(a, b));
	return 0;
}
