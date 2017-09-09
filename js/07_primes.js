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

function isPrime(n) {
	if (n == 1) {
		return false;
	} else if ( n < 4) {
		return true;
	} else if ( n % 2 == 0) {
		return false;
	} else if ( n < 9 ) {
		return true; 
	} else if ( n % 3 == 0) {
		return false;
	} else {
		let r = Math.floor(Math.sqrt(n));
		f = 5;
		while (f <= r) {
			if (n % f == 0) {
				return false;
			} else if (n % (f+2) == 0) {
				return false;
			}
			f = f + 6;
		}
		return true;
	}
}

function nth_prime(lim) {
	var t = timer(lim);
	let limit = lim;
	let count = 1;
	let candidate = 1;
	while (count <limit) {
		candidate += 2;
		if (isPrime(candidate)) {
			count += 1;
		}
	}
	console.log(candidate);
	t.stop();
}
nth_prime(10001);
nth_prime(1000000);
nth_prime(2000000);
