//A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
//
//Find the largest palindrome made from the product of two 3-digit numbers.
function sortNumber(a, b) {
	return a - b;
}

function reverseString(str) {
	var splitString = str.split("");
        var reverseArray = splitString.reverse();
	var joinArray = reverseArray.join("");
	return joinArray;
}

function is_palindrome(integer) {
	if (reverseString(integer.toString()) == integer.toString()) {
		return true;
	}
	return false;
}

var sum = []
function product() {
	for (a = 100; a <= 999; a++) {
		for (b = 100; b <= 999; b++) {
			if (is_palindrome(a*b)) {
				sum.push(a*b);
			}
		}
	}
	sum = sum.sort(sortNumber);
	console.log(sum.pop());
}
product()
