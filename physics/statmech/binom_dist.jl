using Plots

N = 10
n = 1:N-1

P = - N .* (log(2) .+ n./N .* log.(n./N) .+ (N.-n) ./ N .* log.((N.-n)./N))

norm = sum(ℯ.^P)

plot(n, ℯ.^P/norm)

exact = []
for i ∈ n
	pn = factorial(N)/(factorial(N-i)*factorial(i)) * 0.5^N
	append!(exact, pn)
end
println(exact)
plot!(n, exact, label="exact")
