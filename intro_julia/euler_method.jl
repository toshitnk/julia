using PyPlot: plt


# Plot Exact solution
t_plot = collect(0:0.05:1)
# x_plot = @. ℯ^(-2) * ℯ^(-2 * t_plot * (t_plot-2)) #マクロでもいける
x_plot = ℯ^(-2) .* ℯ.^(-2 * t_plot .* (t_plot .- 2)) 

plt.plot(t_plot, x_plot, label="Exact")

# approximation

function euler_method(x_init, tmin, tmax; h, line)
    Nmax = Int((tmax - tmin) / h)
    x = x_init
    t_plot = Float64[0.0]
    x_plot = Float64[x]

    for it = 1:Nmax
        t = tmin + it * h
        x = x - 4.0 * (t-1.0) * x * h
        append!(t_plot, t)
        append!(x_plot, x)
    end

    if line
        plt.plot(t_plot, x_plot, label="Euler h=$h")
    else
        plt.scatter(t_plot, x_plot, label="Euler h=$h", marker=".")
    end    
end

euler_method(ℯ^(-2), 0.0, 1.0, h=0.5, line=false)
euler_method(ℯ^(-2), 0.0, 1.0, h=0.1, line=false)
euler_method(ℯ^(-2), 0.0, 1.0, h=0.01, line=false)
euler_method(ℯ^(-2), 0.0, 1.0, h=0.001,line=true)


plt.ylabel(raw"$x(t)$")
plt.xlabel(raw"$t$")
plt.legend()
plt.ylim(0, 1.2)
plt.savefig("euler_method.png")
plt.show()


