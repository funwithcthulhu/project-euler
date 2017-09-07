#include <stdio.h>

int main(void) 
{
	long sum = 0;
	long first = 1;
	long second = 2;
	long temp;
	long input;
	printf("Please enter an integer: ");
	scanf("%ld", &input);
	do {
		if (first % 2 == 0) {
			sum = sum + first;
		}
		temp = second;
		second = first + second;
		first = temp;
	} while (first <= input);
	printf("%ld\n", sum);
	return 0;
}
