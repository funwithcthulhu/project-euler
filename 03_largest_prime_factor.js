var input = 600851475143;

function largest_prime(n) {
	for (i = 2; i <= n; i++) {
		while (n % i == 0) {
			n = n / i;
		}
		if (n == 1) {
			return console.log(i);
		}
	}
}
largest_prime(input);

