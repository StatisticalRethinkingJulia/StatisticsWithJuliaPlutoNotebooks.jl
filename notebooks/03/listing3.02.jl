### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, StatsBase, DataFrames, Plots, Measures
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.2"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	pDiscrete = [0.25, 0.25, 0.5]
	xGridD = 0:2
end;

# ╔═╡ 7e20eac0-1f6d-11eb-23c8-f7f93c8ec92b
pContinuous(x) = 3/4*(1 - x^2)

# ╔═╡ 7e212a44-1f6d-11eb-17a5-a56e8476b5cf
xGridC = -1:0.01:1;

# ╔═╡ 7e21ad70-1f6d-11eb-1e7a-5982011bd333
pContinuous2(x) = x < 0 ? x+1 : 1-x

# ╔═╡ 7e2dde18-1f6d-11eb-2165-fd23fbaf928e
begin
	p1 = plot(xGridD, line=:stem, pDiscrete, marker=:circle, c=:blue, ms=6, msw=0)
	p2 = plot(xGridC, pContinuous.(xGridC), c=:blue)
	p3 = plot(xGridC, pContinuous2.(xGridC), c=:blue)

	plot(p1, p2, p3, layout=(1,3), legend=false, ylims=(0,1.1), xlabel="x",
		ylabel=["Probability" "Density" "Density"], size=(1200, 400), margin=5mm)
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.2"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═7e20eac0-1f6d-11eb-23c8-f7f93c8ec92b
# ╠═7e212a44-1f6d-11eb-17a5-a56e8476b5cf
# ╠═7e21ad70-1f6d-11eb-1e7a-5982011bd333
# ╠═7e2dde18-1f6d-11eb-2165-fd23fbaf928e
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
