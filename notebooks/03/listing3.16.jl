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
md"## Listing 3.16"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
function rouletteSpins(p)
    x = 0
    while true
        x += 1
        if rand() < p
            return x
        end
    end
end

# ╔═╡ beee83e0-2162-11eb-10f1-7f63ce3708d2
begin
	p, xGrid, N = 18/37, 1:7, 10^6
	mcEstimate = counts([rouletteSpins(p) for _ in 1:N],xGrid)/N

	gDist = Geometric(p)
	gPmf = [pdf(gDist,x-1) for x in xGrid]
end;

# ╔═╡ beeeb36a-2162-11eb-0698-5fc29070f3ee
begin
	plot(xGrid, mcEstimate, line=:stem, marker=:circle, 
		c=:blue, ms=10, msw=0, lw=4, label="MC estimate")
	plot!( xGrid, gPmf, line=:stem, marker=:xcross,
		c=:red, ms=6, msw=0, lw=2, label="PMF",
		ylims=(0,0.5), xlabel="x", ylabel="Probability")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.16"

# ╔═╡ Cell order:
# ╠═ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═beee83e0-2162-11eb-10f1-7f63ce3708d2
# ╠═beeeb36a-2162-11eb-0698-5fc29070f3ee
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
