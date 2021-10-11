using Plots

N = 1:20
approx = N .* (log.(N) .- 1)
plot(N, log.(factorial.(big.(N))), label=raw"$\log N!$", legend=:topleft)
plot!(N, approx, label=raw"$N(\log N -1)$")
xlabel!(raw"$N$")
