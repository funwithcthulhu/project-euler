// Project Euler Problem 9
// A Pythagorean triplet is a set of three natural numbers,
// a < b < c, for which,

// a^2 + b^2 = c^2

// For example, 32 + 42 = 9 + 16 = 25 = 52.

// There exists exactly one Pythagorean triplet for which a + b + c = 1000.
// Find the product abc.

// $ ./009_special_pythagorean_triplet 
// 31875000

#include <stdio.h>
#include <math.h>

int main(void)
{
    for (int a = 1; a < 1000; a++)
    {
        for (int b = a + 1; b < 1000; b++)
        {
            long c = sqrt(a*a + b*b);
            if (((a + b + c) == 1000) && (a*a + b*b == c*c))
            {
                printf("%li\n", a * b * c);
                break;
            }
        }
    }
}
