// Project Euler Problem 21 - Amicable Numbers
// Let d(n) be defined as the sum of proper divisors of n
// (numbers less than n which divide evenly into n).
//
// If d(a) = b and d(b) = a, where a ≠ b, then a and b are an
// amicable pair and each of a and b are called amicable numbers.

// For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
// therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

// Evaluate the sum of all the amicable numbers under 10000.
// 31626

#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int amicable(int number);
int divisor_sum(int number);

int main(int argc, char *argv[])
{
    char *p;
    unsigned int input;

    if (argc != 2)
    {
        printf("use: %s INPUT\n", argv[0]);
        return 1;
    }

    input = strtol(argv[1], &p, 10);
    
    int sum = 0;
    for (int i = 2; i < input; i++)
    {
        if (amicable(i))
        {
            sum += i;
        }
    }
    printf("%i\n", sum);
}

int amicable(int number)
{
    int sum_of_input = divisor_sum(number);
    int possible = divisor_sum(sum_of_input);
    if (possible == number && sum_of_input != number)
    {
        return 1;
    }
    return 0;
}

int divisor_sum(int number)
{
    int sum_of_divisors = 0;
    int temp;
    for (int a = 1; a < sqrt(number); a++)
    {
        if (number % a == 0)
        {
            temp = number / a;
            sum_of_divisors += a;
            if (temp != number)
            {
                sum_of_divisors += temp;
            }
        }
    }
    return sum_of_divisors;
}
