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
md"## Listing 3.28"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	N = 10^6
	sig = 1.7

	data1 = sqrt.(-(2* sig^2)*log.(rand(N)))

	distG = Normal(0,sig)
	data2 = sqrt.(rand(distG,N).^2 + rand(distG,N).^2)

	distR = Rayleigh(sig)
	data3 = rand(distR,N)

	mean.([data1, data2, data3])
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.28"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
