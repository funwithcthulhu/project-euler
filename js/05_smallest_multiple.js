// 2520 is the smallest number that can be divided by each of
// the numbers from 1 to 10 without any remainder.
// What is the smallest positive number that is evenly divisible
// by all of the numbers from 1 to 20?
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


function smallest(n) {
	var t = timer(n)
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
	t.stop();
}

smallest(10);
smallest(20);
smallest(22);
