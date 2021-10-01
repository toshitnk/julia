using Plots
using LinearAlgebra

function make_H1d(N, a)
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
mat_H = make_H1d(N, a)
ε, ψ = eigen(mat_H)

println("minimum eigenvalue: $(ε[1])")


norm = sum(dot(ψ[1:N, 1], ψ[1:N, 1]))
println("check normalization of numerical solution: $(norm)")



# plot eigenstates -------------------

plot(1:N, ψ[1:N, 1], label="numerical")


# exact solution -------------------------
	# このへんのLとかはaをかけるべきだけど，
	# 規格化の都合に合わせた．
	# 本当はnumericalの方の引数をxで表すべきだけど，
	# テキストがそうなってなくて，合わせるのがめんどくさかったので...
	# x軸の縮尺を100倍したとかんがえればよい．
	
	
L = (N + 1)
x = (1:N) 
ψ_exact = sqrt(2/L) .* sin.(π .* x /L)

plot!(x, ψ_exact, label="exact", linestyle="dot")

#println(sum(dot(ψ_exact, ψ_exact)))

