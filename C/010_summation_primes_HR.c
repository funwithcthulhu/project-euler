/* 
Project Euler Problem 10: Summation of Primes
*********************
This solution was completed for the hackerrank
version of the problem.
**********************

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes not greater than given N.

Input Format

The first line contains an integer T i.e. number of the test cases. 
The next T lines will contains an integer N.

Constraints

1 <= T <= 10^4
1 <= N <= 10**6

Output Format

Print the value corresponding to each test case in separate line.

Sample Input 0

2
5
10

Sample Output 0

10
17

Explanation 0

For N = 5, we have primes as {2,3,5} and the sum is 10.
For N = 10, we have primes as {2,3,5,7} and the sum is 17.

*/


#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <limits.h>
#include <stdbool.h>
#include <stdint.h>

void sieve(int_fast64_t limit, char *primes_array);
void sum(int_fast64_t limit, int_fast64_t *sums, char *primes_array);

int main(){
    char *primes_array = calloc(1000000, sizeof(char));
    memset(primes_array, 1, 1000000);
    sieve(1000000 , primes_array);
    int_fast64_t sums[1000000] = {0};
    sum(1000000 , sums, primes_array);
    int t; 
    scanf("%d",&t);
    for(int a0 = 0; a0 < t; a0++){
        int_fast64_t n; 
        scanf("%lld",&n);
        printf("%lli\n", sums[n]);
    }
    return 0;
}

void sum(int_fast64_t limit, int_fast64_t *sums, char *primes_array)
{
    int_fast64_t running_tally = 0;
    for (int_fast64_t i = 0; i < limit; i++)
    {
        
        if (primes_array[i])
        {
            running_tally += i;
        }
        sums[i] = running_tally;
    }
    
}

void sieve(int_fast64_t limit, char *primes_array)
{
	for (size_t i = 0; i < 2; i++)
	{
		primes_array[i] = 0;
	}

	for (int_fast64_t idx = 2; idx < (sqrt(limit) + 1);)
	{
		for (int_fast64_t n_idx = (idx * 2);
			 n_idx < (limit + 1); n_idx += idx)
			 {
				 primes_array[n_idx] = 0;
			 }
			 do
			 {
				 idx++;
				 if (primes_array[idx]) break;
			 } while (idx < (sqrt(limit) + 1));
	}
}