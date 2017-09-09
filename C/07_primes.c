#include <stdio.h>
#include <time.h>
#include <stdbool.h>
#include <math.h>

bool isPrime(int n);

int main(void)
{
	clock_t start, end;
	double cpu_time_used;
	start = clock();

	int limit;
	int count = 1;
	int candidate = 1;

	printf("Please enter nth Prime you'd like to see: ");
	scanf("%i", &limit);

	while (count < limit) {
		candidate += 2;
		if (isPrime(candidate)) {
			count += 1;
		}
	}
	printf("> %i\n", candidate);
	end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Timer: %i finished in %f s\n", limit, cpu_time_used);
}

bool isPrime(int n)
{
	if (n == 1) {
		return false;
	} else if (n < 4) {
		return true;
	} else if (n % 2 == 0) {
		return false;
	} else if (n < 9) {
		return true;
	} else if (n % 3 == 0) {
		return false;
	} else {
		int r = floor(sqrt(n));
		int f = 5;
		while (f <= r) {
			if (n % f == 0) {
				return false;
			} else if (n % (f + 2) == 0) {
				return false;
			}
			f += 6;
		}
		return true;
	}
}
	
