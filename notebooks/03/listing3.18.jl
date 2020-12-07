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
md"## Listing 3.18"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	L, K, n  = 500, [450, 400, 250, 100, 50], 30
	hyperDists = [Hypergeometric(k,L-k,n) for k in K]
	xGrid = 0:1:n
	pmfs = [ pdf.(dist, xGrid) for dist in hyperDists ]
	labels = "Successes = " .* string.(K)
end

# ╔═╡ bfe8d6f0-2163-11eb-22e7-9b978bc1d407
begin
	bar( xGrid, pmfs, 
		alpha=0.8, c=[:orange :purple :green :red :blue ],
		label=hcat(labels...), ylims=(0,0.25),
		xlabel="x", ylabel="Probability", legend=:top)
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.18"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═bfe8d6f0-2163-11eb-22e7-9b978bc1d407
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
