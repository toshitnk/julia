using PyPlot: plt
using PyCall
using Dates
# anm = pyimport("matplotlib.animation")

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
        # append!(x_plot, x)
        # append!(y_plot, y)
    end
    return cnt / Nmax *4
end

start = Dates.now()
Nlist = []
pilist = []
for N in 100:100:100000
    pi = montecalro_pi(N)
    append!(Nlist, N)
    append!(pilist, pi)
end

elapsed_time = Dates.now() - start
print(elapsed_time)

plt.plot(Nlist, pilist)
plt.axhline(π)
plt.savefig("montecalro_pi_estimate.png")
plt.show()