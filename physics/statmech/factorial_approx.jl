using Plots

N = 1:100
approx = N .* (log.(N) .- 1)
approx2 = 0.5 .* log.(2 * π .* N) .+ N .* (log.(N) .- 1)
plot(N, log.(factorial.(big.(N))),lc = :black,  label=raw"$\log N!$", legend=:topleft)
plot!(N, approx, label=raw"$N(\log N -1)$",lc = :black, ls= :dot)
# plot!(N, approx2, label=raw"$\log(\sqrt{2\pi n}(n/e)^n)$", ls = :dash, lc=:black)
xlabel!(raw"$N$")
