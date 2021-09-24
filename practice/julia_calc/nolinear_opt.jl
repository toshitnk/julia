using Optim

f2(x) = 2 * x^2 + 3 * x + 1

a2 = optimize(f2, -2.0, 1.0)

x_sol = Optim.minimizer(a2)
println("x_sol = $(x_sol)")

f_min = Optim.minimum(a2)
println("f min = $(f_min)")
