// Problem 12 from Project Euler
// Solves the challenge problem (first triangle number 
// with > 500 divisors) in a second or less

// Mostly naive approach (brute force), however the
// factors function has been optimized to O(sqrt(n))

#include <stdio.h>
#include <math.h>

int factors(int n);
int triangle(int n);
int triangle_factors(int n, int divisor);

int main(void)
{
    int input;
    int divisor;
    printf("input: ");
    scanf("%i", &input);
    printf("divisor: ");
    scanf("%i", &divisor);
    printf("%i\n", triangle_factors(input, divisor));
    return 0;
}

// checks the nth triangle number for a given input n for the
// number of factors it has. if that number is greater than the
// divisor input number, returns the nth triangle, otherwise
// recursively checks the n + 1 triangle number
int triangle_factors(int n, int divisor)
{
    if (factors(triangle(n)) > divisor) {
        return triangle(n);
    } else {
        return triangle_factors(n + 1, divisor);
    }
}

// Finds the nth "triangle" number
// i.e. the 5th triangle number is 1 + 2 + 3 + 4 + 5 = 15
int triangle(int n)
{
    int start = 1;
    int num = 0;
    do 
    {
        num += start;
        start++;
    } while (start < n);
    return num;
}

// Finds and returns the number of factors for a given input
int factors(int n)
{
    int number_of_factors = 0;
    for (int i = 1; i < floor(sqrt(n)); i++) {
        if (n % i == 0) {
            number_of_factors++;
        }
    }

    // As we are only looping to the sqrt of a given number, we need
    // to multiply by 2 to get the correct number of factors
    return number_of_factors * 2;
}