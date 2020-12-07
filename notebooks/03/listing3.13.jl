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
md"## Listing 3.13"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
dists = [
    DiscreteUniform(10,20),
    Binomial(10,0.5),
    Geometric(0.5),
    NegativeBinomial(10,0.5),
    Hypergeometric(30, 40, 10),
    Poisson(5.5)]

# ╔═╡ b3515100-2155-11eb-3ae3-55afcaa336ba
begin
	df = DataFrame()
	df.distributions = dists
	df.params = params.(dists)
	df.support = ( (d)->( minimum(d),maximum(d) ) ).(dists)
	df
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.13"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═b3515100-2155-11eb-3ae3-55afcaa336ba
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
