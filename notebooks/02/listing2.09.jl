### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Plots
end

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.9"

# ╔═╡ c4bef1a4-1ee9-11eb-0b58-8be033f6fbad
occupancyAnalytic(n,r) =  sum([(-1)^k*binomial(n,k)*(1 - k/n)^r for k in 0:n])

# ╔═╡ 8ce90c92-1eee-11eb-21f7-f78acba42f4a
function occupancyMC(n,r,N)
    fullCount = 0
    for _ in 1:N
        envelopes = zeros(Int,n)
        for k in 1:r
            target = rand(1:n)
            envelopes[target] += 1
        end
        numFilled = sum(envelopes .> 0)
        if numFilled == n
            fullCount += 1
        end
    end
    return fullCount/N
end

# ╔═╡ 8ce947c0-1eee-11eb-0f4e-49531a7b01c6
begin
	max_n, N, Kvals = 100, 10^3, [2,3,4]

	analytic = [[occupancyAnalytic(big(n),big(k*n)) for n in 1:max_n] for k in Kvals]
	monteCarlo = [[occupancyMC(n,k*n,N) for n in 1:max_n] for k in Kvals] 

	plot(1:max_n, analytic, c=[:blue :red :green], 
		label=["K=2" "K=3" "K=4"])
	scatter!(1:max_n, monteCarlo, mc=:black, shape=:+, 
		label="", xlims=(0,max_n),ylims=(0,1), 
		xlabel="n Envelopes", ylabel="Probability", legend=:topright)
end

# ╔═╡ ea086874-1eeb-11eb-2cb0-4186697d4294
md"## End of listing 2.9"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═c4bef1a4-1ee9-11eb-0b58-8be033f6fbad
# ╠═8ce90c92-1eee-11eb-21f7-f78acba42f4a
# ╠═8ce947c0-1eee-11eb-0f4e-49531a7b01c6
# ╟─ea086874-1eeb-11eb-2cb0-4186697d4294
