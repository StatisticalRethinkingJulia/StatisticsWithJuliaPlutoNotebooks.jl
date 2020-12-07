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
md"## Listing 3.22"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	lambda, N = 1, 10^6
	xGrid = 0:6
end

# ╔═╡ 84a73e9a-2165-11eb-3620-d7ddf9c07aff
begin
	expDist = Exponential(1/lambda)
	floorData = counts(convert.(Int,floor.(rand(expDist,N))), xGrid)/N
	geomDist = Geometric(1-MathConstants.e^-lambda)
end

# ╔═╡ 84a76f3c-2165-11eb-0eeb-1bb55507bb51
begin
	plot( xGrid, floorData, 
		line=:stem, marker=:circle, 
		c=:blue, ms=10, msw=0, lw=4, 
		label="Floor of Exponential")
	plot!( xGrid, pdf.(geomDist,xGrid), 
		line=:stem, marker=:xcross, 
		c=:red, ms=6, msw=0, lw=2, 
		label="Geometric", ylims=(0,1), 
		xlabel="x", ylabel="Probability")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.22"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═84a73e9a-2165-11eb-3620-d7ddf9c07aff
# ╠═84a76f3c-2165-11eb-0eeb-1bb55507bb51
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
