// Project Euler Problem 14
// Find the longest Collatz Seq with input < 1000000

// naive recursive solution

#include <stdio.h>

long long collatz(long long n, int counter);

int main(void)
{
  int longest_n = 0;
  int sequence;
  for (long i = 1; i < 1000000; i++) {
    int temp = collatz(i, 1);
    if (temp > longest_n) {
      longest_n = temp;
      sequence = i;
    }
  }
  printf("seq: %i, steps: %i\n", sequence, longest_n);
}

long long collatz(long long n, int counter)
{
  if (n != 1) {
    counter++;
    if (n % 2 == 0) {
      return collatz(n / 2, counter);
    } else if (n % 2 == 1) {
      return collatz(3 * n + 1, counter);
    }
  }
  return counter;
}