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

int triangle_factors(int n, int divisor)
{
    if (factors(triangle(n)) > divisor) {
        return triangle(n);
    } else {
        return triangle_factors(n + 1, divisor);
    }
}

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

int factors(int n)
{
    int number_of_factors = 0;
    for (int i = 1; i < floor(sqrt(n)); i++) {
        if (n % i == 0) {
            number_of_factors++;
        }
    }
    return number_of_factors * 2;
}