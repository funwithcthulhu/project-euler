var s = 1000

for (a = 3; a <= s - 3; a++) {
	for (b = (a + 1); b <= (s - 1 - a); b++) {
		c = (s - a - b);
		if ((c*c) == ((a*a) + (b*b))) {
			console.log(a*b*c);
		}
	}
}

