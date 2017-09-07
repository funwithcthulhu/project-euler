#include <stdio.h>

int main(void) 
{
	long input;
	printf("Please enter an integer: ");
	scanf("%ld", &input);
	for (long i = 2; i <= input; i++) {
		while (input % i == 0) {
			input /= i;
		}
		if (input == 1) {
			printf("%ld\n", i);
		}
	}
	return 0;
}	
