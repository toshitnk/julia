using Plots

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
scatter([x0], [0], label="x0")
for N ∈ 1:10
	xn = newton(x0, N)
	println(xn)
	scatter!([xn], [0], label="N=$(N)")
end

#-----------------------
x = 1.8:0.01:2.1
y = x ./ 2 .- sin.(x)

plot!(x, y, label="y=f(x)")
