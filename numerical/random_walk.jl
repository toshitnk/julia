using Plots


for i ∈ 1:10
	num = 0 + rand((-1, 1))
	numj = [num]
	for j ∈ 2:1000
		if num == 0
			append!(numj, num)
		else
			num = num + rand((-1, 1))
			append!(numj, num)
		end
	end
	plot!(1:1000, numj)
end

plot!()
