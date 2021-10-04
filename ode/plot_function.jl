using Plots

x = 0:0.1:π

f = x ./ 2 .- sin.(x)

plot(x,f)
