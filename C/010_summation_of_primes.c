// Project Euler problem 10: Summation of Primes

// The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

// Find the sum of all the primes below two million.

// Solved Nov 3, 2017 as I go back through earlier PE problems while 
// practicing C99.

// Using prime algo I learned from PE here (yes, it's sort of cheating)

// $ ./010_summation_of_primes
// 142913828922


#include <stdio.h>
#include <math.h>

long isPrime(long n);

int main(void)
{
    long long sum = 2;
    for (long i = 1; i < 2000000; i += 2)
    {
        if (isPrime(i))
        {
            sum += i;
        }
    }
    printf("%lli\n", sum);
}

long isPrime(long n)
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
