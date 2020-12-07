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
	using SpecialFunctions
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.24"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	a,b = 0.2, 0.7
	x = 0.75
end

# ╔═╡ cdacaea2-2167-11eb-3ad7-7521db4ca126
begin
	betaAB1 = beta(a,b)
	betaAB2 = (gamma(a)gamma(b))/gamma(a+b)
	betaAB3 = (factorial(a-1)factorial(b-1))/factorial(a+b-1)
	betaPDFAB1 = pdf(Beta(a,b),x)
	betaPDFAB2 = (1/beta(a,b))*x^(a-1) * (1-x)^(b-1)
end

# ╔═╡ cdaceaca-2167-11eb-00b5-5b987d87a6c0
Text("beta($a,$b)    = $betaAB1,\t$betaAB2,\t$betaAB3 ")

# ╔═╡ cdad87e4-2167-11eb-28b7-8b9600d8049d
Text("betaPDF($a,$b) at $x = $betaPDFAB1,\t$betaPDFAB2")

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.24"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═cdacaea2-2167-11eb-3ad7-7521db4ca126
# ╠═cdaceaca-2167-11eb-00b5-5b987d87a6c0
# ╠═cdad87e4-2167-11eb-28b7-8b9600d8049d
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
