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

x0 = π

error_list = []
for n ∈ 1:10
	xn = newton(x0, n)
	push!(error_list, xn)
end
ans = newton(x0, 10)
scatter(1:10, error_list.-ans)

