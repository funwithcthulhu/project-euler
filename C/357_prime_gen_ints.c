// Project Euler Problem 357
// Consider the divisors of 30: 1,2,3,5,6,10,15,30.
// It can be seen that for every divisor d of 30, d+30/d is prime.
//
// Find the sum of all positive integers n not exceeding 100 000 000
// such that for every divisor d of n, d+n/d is prime.

// $ ./357_prime_gen_ints 100000000
// Sum of prime generating integers: 1739023853137
// Timer: 181.217892 s
//
// $ ./357_prime_gen_ints 10
// Sum of prime generating integers: 19
// Timer: 0.000041 s
// $ ./357_prime_gen_ints 100
// Sum of prime generating integers: 401
// Timer: 0.000055 s
// $ ./357_prime_gen_ints 1000
// Sum of prime generating integers: 8427
// Timer: 0.000120 s
// $ ./357_prime_gen_ints 10000
// Sum of prime generating integers: 262615
// Timer: 0.001000 s
// $ ./357_prime_gen_ints 100000
// Sum of prime generating integers: 9157937
// Timer: 0.015168 s
// $ ./357_prime_gen_ints 1000000
// Sum of prime generating integers: 524402305
// Timer: 0.301059 s
// $ ./357_prime_gen_ints 10000000
// Sum of prime generating integers: 27814470277
// Timer: 7.089371 s

#include <stdio.h>
#include <time.h>
#include <math.h>
#include <stdlib.h>

int isPrime(long n);
int generator(long n, long *primes);
long sum(long n, long *primes);

int main(int argc, char *argv[])
{
    clock_t start, end;
	double cpu_time_used;
    start = clock();
    
    char *p;
    long input;

    if (argc != 2)
    {
        printf("use: %s INPUT\n", argv[0]);
        return 1;
    }

    input = strtol(argv[1], &p, 10);

    long *primes = malloc(input * sizeof(long));
    for (long i = 1; i <= input; i++)
    {
        if (i & 0)
        {
            primes[i] = 0;
        }
        else if (isPrime(i))
        {
            primes[i] = 1;
        }
    }

    printf("Sum of prime generating integers: %li\n", sum(input, primes));

    end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Timer: %f s\n", cpu_time_used);
}

long sum(long n, long *primes)
{
    long sum = 0;
    for (long i = 1; i <= n; i++)
    {
        if ((i & 1) && i > 1)
        {
            continue;
        }
        if (primes[i + 1] == 0)
        {
            continue;
        }
        if (primes[i/2 + 2] == 0)
        {
            continue;
        }
        if (generator(i, primes))
        {
            sum += i;
        }
    }
    return sum;
}

int generator(long n, long *primes)
{
    long divisors[1000];
    long count = 0;
    for (long j = 1; j <= sqrt(n); j++)
    {
        if (n % j == 0)
        {
            divisors[count] = j;
            count++;
            divisors[count] = (n / j);
            count++;
        }
    }

    for (long k = 0; k < count; k++)
    {
        long temp = divisors[k] + (n / divisors[k]);
        if (primes[temp] == 0)
        {
            return 0;
        }
    }
    return 1;
}

int isPrime(long n)
{
    if (n == 1)
    {
        return 0;
    }
    else if (n < 4)
    {
        return 1;
    }
    else if (n % 2 == 0)
    {
        return 0;
    }
    else if (n < 9)
    {
        return 1;
    }
    else if (n % 3 == 0)
    {
        return 0;
    }
    else
    {
        long r = floor(sqrt(n));
        long f = 5;
        while (f <= r)
        {
            if (n % f == 0)
            {       
                return 0;
            }
            else if (n % (f + 2) == 0)
            {
                return 0;
            }
            f += 6;
        }
        return 1;
    }
}
