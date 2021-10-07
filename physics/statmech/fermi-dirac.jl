using Plots

ϵ = -10^4:10^4
T_list = [ 50, 100, 300, 500, 1000]

fd(T) = 1 ./ (ℯ.^(ϵ./T).+1)

for T ∈ T_list
	plot!(ϵ, fd(T), label="T=$T K")
end
plot!()
