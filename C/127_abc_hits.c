//  Project Euler Problem 127
// The radical of n, rad(n), is the product of distinct prime factors of n.
// For example, 504 = 23 × 32 × 7, so rad(504) = 2 × 3 × 7 = 42.

// We shall define the triplet of positive integers (a, b, c) to be an abc-hit if:

// GCD(a, b) = GCD(a, c) = GCD(b, c) = 1
// a < b
// a + b = c
// rad(abc) < c
// For example, (5, 27, 32) is an abc-hit, because:

// GCD(5, 27) = GCD(5, 32) = GCD(27, 32) = 1
// 5 < 27
// 5 + 27 = 32
// rad(4320) = 30 < 32
// It turns out that abc-hits are quite rare and there are only thirty-one abc-hits
// for c < 1000, with ∑c = 12523.

// Find ∑c for c < 120000.

// 18407904
// Timer: 172.818758 s

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

int isPrime(long n);
long radical(long num);
long gcd(long a, long b);

int main(int argc, char *argv[])
{
    clock_t start, end;
	double cpu_time_used;
    start = clock();

    if (argc != 2)
    {
        printf("use: %s INPUT\n", argv[0]);
        return 1;
    }

    long sum = 0;
    char *p;
    long input;
    input = strtol(argv[1], &p, 10);

    long *radicals = malloc(input * sizeof(long));
    radicals[0] = 0;

    for (long i = 1; i < input; i++)
    {
        radicals[i] = radical(i);
    }

    for (long a = 1; a < input; a++)
    {
        for (long b = a + 1; b < input; b++)
        {
            if (a + b >= input)
            {
                break;
            }
            if (b < a)
            {
                continue;
            }
            if ((a + b)/radicals[a + b] < radicals[a] * radicals[b])
            {
                continue;
            }
            if (gcd(a, b) != 1)
            {
                continue;
            }
            if ((radicals[a] * radicals[b] * radicals[a + b]) >= a + b)
            {
                continue;
            }
            sum += (a + b);
        }
    }

    printf("%li\n", sum);
    end = clock();
	cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Timer: %f s\n", cpu_time_used);
}

long radical(long num)
{
    long *product = malloc((num + 1) * sizeof(long));
    long sum = 1;

    for (long i = 1; i < num + 1; i++)
    {
        if ((num % i == 0) && isPrime(i))
        {
            product[i - 1] = i;
        }
        else
        {
            product[i - 1] = 0;
        }
    }
    for (long i = 0; i < num; i++)
    { 
        if (product[i] != 0)
        {
            sum *= product[i];
        }
    }
    return sum;
}

long gcd(long a, long b)
{
    long temp;
    while (b != 0)
    {
        temp = a % b;

        a = b;
        b = temp;
    }
    return a;
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
