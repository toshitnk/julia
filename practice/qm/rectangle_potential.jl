using LinearAlgebra
using Plots

# potentialの作成　--------------------------------
 
function calc_V(N, V_0)
	vec_V = zeros(Float64, N)
	dx = N/6
	for i ∈ 1:N
		if N/2 - dx <= i <= N/2 + dx
			vec_V[i] = V_0
		end
	end

	return vec_V
end

# make hamiltonian ------------------------------

function make_H1dv(N,a,V_0)
	mat_H = zeros(Float64, N, N)
	vec_V = calc_V(N, V_0)

	for i ∈ 1:N
		for dx ∈ -1:1
			j = i + dx
			v = 0.0
			if dx == 0
				v = (2/a^2 + vec_V[i])
			elseif dx == 1
				v = (-1/a^2)
			elseif dx == -1
				v = (-1/a^2)
			end

			if 1 <= j <= N
				mat_H[i, j] = v
			end
		end
	end

	return mat_H
end

# check potential ---------------------------
#=

N = 1000

x = Int64[]
for i ∈ 1:N
	append!(x, i)
end

V_0 = 1.0
vec_V = calc_V(N, V_0)

plot(x, vec_V, label = "rectangle potential")
=#

# --------------------------------------------



# set values
N = 1000
a = 0.01
V_0 = 1.0

mat_H = make_H1dv(N, a,V_0)

ε, ψ = eigen(mat_H)

println("ground energy: $(ε[1])")

plot(1:N, ψ[1:N, 1], label="eigenstate")
