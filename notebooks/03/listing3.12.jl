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
md"## Listing 3.12"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	triangDist = TriangularDist(0,2,1)
	xGrid = 0:0.1:2
		N = 10^6
	inverseSampledData = quantile.(triangDist,rand(N))
end

# ╔═╡ b690890a-2135-11eb-1abc-933c757a93f8
begin
	histogram( inverseSampledData, bins=30, normed=true,
		ylims=(0,1.1), label="Inverse transform data")
	plot!( xGrid, pdf.(triangDist,xGrid), c=:red, lw=4, 
		xlabel="x", label="PDF", ylabel = "Density", legend=:topright)
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.12"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═b690890a-2135-11eb-1abc-933c757a93f8
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
