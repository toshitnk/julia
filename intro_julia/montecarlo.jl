using PyPlot: plt

function montecalro_pi(Nmax = 10)
    cnt = 0
    x_plot = []
    y_plot = []

    for i in 1:Nmax
        x = rand()
        y = rand()
        if x^2 + y^2 < 1
            cnt += 1
        end
        append!(x_plot, x)
        append!(y_plot, y)
    end
    plt.scatter(x_plot, y_plot, label="Monte-carlo N=$Nmax , π=$(cnt / Nmax *4)", marker=".", alpha=0.5)
    return cnt / Nmax *4
end

pi10 = montecalro_pi()
println("pi10 = $pi10")

pi500 = montecalro_pi(500)
println("pi500 = $pi500")

pi5000 = montecalro_pi(5000)
println("pi5000=$pi5000")

θ = collect(0:0.1:π/2)
x_plot = cos.(θ)
y_plot = sin.(θ)
plt.plot(x_plot,y_plot,color="red")
# plt.axes().set_aspect("equal")
plt.xlim(-0.05,1.5)
plt.ylim(-0.05,1.5)

plt.legend()

plt.savefig("montecarlo_pi.png")
plt.show()
