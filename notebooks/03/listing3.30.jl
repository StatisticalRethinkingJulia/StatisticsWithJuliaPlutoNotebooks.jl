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
md"## Listing 3.30"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	n = 10^6
	data = tan.(rand(n)*pi .- pi/2)
	averages = accumulate(+,data)./collect(1:n)
end

# ╔═╡ 588624fe-21c2-11eb-3d7b-f37b1c1f44ca
plot( 1:n, averages, 
	c=:blue, legend=:none, 
	xscale=:log10, xlims=(1,n), xlabel="n", ylabel="Running average")

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.30"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═588624fe-21c2-11eb-3d7b-f37b1c1f44ca
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
