using DifferentialEquations

f(u, p, t) = 1.01 * u
u0 = 1 / 2
t_span = (0.0, 1.0)

prob = ODEProblem(f, u0, t_span)
sol = solve(prob, Tsit5(), reltol = 1e-8, abstol = 1e-8)

nt = 50
t = range(0.0, stop = 1.0, length = nt)
for i ∈  1:nt
	println("t = $(t[i]), solution: $(sol(t[i])), exact solution $(0.5 * ℯ^(1.01 * t[i]))")
end
