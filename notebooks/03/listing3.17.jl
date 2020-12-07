### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Random, StatsBase, DataFrames, Plots
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.17"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
function rouletteSpins(r,p)
    x = 0
    wins = 0
    while true
        x += 1
        if rand() < p
            wins += 1
            if wins == r
                return x
            end
        end
    end
end

# ╔═╡ 6b47d86c-2163-11eb-157b-136057260d22
begin
	r, p, N = 5, 18/37,10^6
	xGrid = r:r+15

	mcEstimate = counts([rouletteSpins(r,p) for _ in 1:N],xGrid)/N

	nbDist = NegativeBinomial(r,p)
	nbPmf = [pdf(nbDist,x-r) for x in xGrid]
end;

# ╔═╡ 6b480968-2163-11eb-0f1c-d18166a51f5e
begin
	plot( xGrid, mcEstimate, 
		line=:stem, marker=:circle, c=:blue, 
		ms=10, msw=0, lw=4, label="MC estimate")
	plot!( xGrid, nbPmf, line=:stem, 
		 marker=:xcross, c=:red, ms=6, msw=0, lw=2, label="PMF", 
		 xlims=(0,maximum(xGrid)), ylims=(0,0.2), 
		 xlabel="x", ylabel="Probability")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.17"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═6b47d86c-2163-11eb-157b-136057260d22
# ╠═6b480968-2163-11eb-0f1c-d18166a51f5e
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
