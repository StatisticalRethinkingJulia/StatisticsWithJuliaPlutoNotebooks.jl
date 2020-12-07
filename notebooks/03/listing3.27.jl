### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Random, StatsBase, DataFrames
	using Plots, LaTeXStrings
	using Calculus, SpecialFunctions
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.27"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	xGrid = -5:0.01:5

	PhiA(x) = 0.5*(1+erf(x/sqrt(2)))
	PhiB(x) = cdf(Normal(),x)

	Text("Maximum difference between two CDF implementations: $(maximum(PhiA.(xGrid) - PhiB.(xGrid)))")
end

# ╔═╡ 28860946-21c1-11eb-228d-09798b3886ad
begin
	normalDensity(z) = pdf(Normal(),z)

	d0 = normalDensity.(xGrid)
	d1 = derivative.(normalDensity,xGrid)
	d2 = second_derivative.(normalDensity, xGrid)

	plot(xGrid, [d0 d1 d2], c=[:blue :red :green],label=[L"f(x)" L"f'(x)" L"f''(x)"])
	plot!([-5,5],[0,0],  color=:black, lw=0.5, xlabel="x", xlims=(-5,5), label="")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.27"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═28860946-21c1-11eb-228d-09798b3886ad
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
