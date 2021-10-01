using Plots
using LinearAlgebra

function make_h1d(N, a)
	mat_H = zeros(Float64, N, N)
	vec_V = zeros(Float64, N)

	for i ∈ 1:N
		for dx ∈ -1:1
			j = i + dx
			v = 0.0

			if dx == 0
				v = (2/a^2 + vec_V[i])
			elseif dx == -1
				v = -1/a^2
			elseif dx == 1
				v = -1/a^2
			end

			if 1 <= j <= N
				mat_H[i, j] = v
			end
		end
	end
	return mat_H
end

N = 1000
a = 0.01

mat_H = make_h1d(N, a)
ε, ψ = eigen(mat_H)

integers = Int64[]
for i ∈ 1:N
	append!(integers, i)
end

plot(integers[1:N], ε[1:N], label="numerical", marker=:circle, mc=:blue, msc=:blue)




# exact solution -------------------

E = Float64[]

for i ∈ integers
		Ei = (π / (a * (N+1)))^2 * i^2
	append!(E, Ei)
end

plot!(integers, E, label="exact", marker=:circle, mc=:orange, msc=:orange)

savefig("infinite_ido.png")
