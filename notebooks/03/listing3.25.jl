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
	using QuadGK, SpecialFunctions
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.25"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
g(x) = x^(0.5-1) * MathConstants.e^-x

# ╔═╡ f8ef8fb4-21bf-11eb-2f3e-73cc8d30faaf
quadgk(g,0,Inf)[1], sqrt(pi), gamma(1/2),  factorial(1/2-1)

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.25"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═f8ef8fb4-21bf-11eb-2f3e-73cc8d30faaf
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
