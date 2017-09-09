var timer = function(name) {
	var start = new Date();
	return {
		stop: function() {
			var end  = new Date();
			var time = end.getTime() - start.getTime();
			console.log('Timer:', name, 'finished in', time, 'ms');
		}
	}
};

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
var t = timer(input);
largest_prime(input);
t.stop();
