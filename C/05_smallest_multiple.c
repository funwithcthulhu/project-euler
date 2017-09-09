#include <stdio.h>
#include <time.h>

int main(void)
{
	clock_t start, end;
	double cpu_time_used;

	start = clock();

	long long n;
	printf("Please input an integer: ");
	scanf("%lld", &n);
	int begin = n;
	int num = begin;
	while (num > 0) {
		if (n % num == 0) {
			num -= 1;
		} else {
			num = begin;
		}
		if (num == 0) {
			break;
		} else {
			n += 1;
		}
	}
	printf("> %lld\n", n + 1);
	end = clock();
	cpu_time_used = ((double) (end-start)) / CLOCKS_PER_SEC;
	printf("Timer: %i finished in %f s\n", begin, cpu_time_used);
}

	

