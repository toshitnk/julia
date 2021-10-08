using Plots
using Random
Random.seed!(13526463)

for i ∈ 1:50
	num = 0 + rand((-1, 1))
	numj = [num]
	for j ∈ 2:2500
		if num == 0
			append!(numj, num)
		else
			num = num + rand((-1, 1))
			append!(numj, num)
		end
	end
	plot!(1:2500, numj, label="")
end

plot!()
savefig("1d_random.png")
