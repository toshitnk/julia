using SpecialFunctions
using Plots

function g(x)
	gsum = 0
	for n = 0:10
		gsum += besseli(n, x) + n^2 * besseli(2*n, x)
	end
	return gsum
end

xs = range(0, 1, length = 100)
temp = g.(xs)
plot(xs, temp)

savefig("bessel.png")
