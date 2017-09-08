// 2520 is the smallest number that can be divided by each of
// the numbers from 1 to 10 without any remainder.
// What is the smallest positive number that is evenly divisible
// by all of the numbers from 1 to 20?

function smallest(n) {
	let start = n;
	let num = start;
	while (num > 0) {
		if (n % num == 0) {
			num -= 1;
		} else {
			num = start;
		}
		if (num == 0) {
			break;
		} else {
			n += 1;
		}

	}
	console.log(n + 1);
}

smallest(10);
smallest(20);
