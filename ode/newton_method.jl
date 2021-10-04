function func(x)
	f = x/2 - sin(x)
	return f
end

function diff(x)
	df = 1/2 - cos(x)
	return df
end

function newton(x0, N)
	x = x0
	for i ∈ 1:N
		x = x - func(x)/diff(x)
	end

	return x
end

x0 = π/2
N = 10
xN = newton(x0, N)

println(xN)

#-----------------------
x = 0:0.1:π
y = x ./ 2 .- sin.(x)

plot(x, y)
scatter!([xN], [0])
