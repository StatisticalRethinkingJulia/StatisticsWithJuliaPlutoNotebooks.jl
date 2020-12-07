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
md"## Listing 3.15"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
binomialRV(n,p) = sum(rand(n) .< p)

# ╔═╡ 3c3fe880-2162-11eb-2efd-b53935597f04
begin
	p, n, N = 0.5, 10, 10^6
end;

# ╔═╡ 3c400b1c-2162-11eb-2196-09023e52b6af
begin
	bDist = Binomial(n,p)
	xGrid = 0:n
	bPmf = [pdf(bDist,i) for i in xGrid]
	data = [binomialRV(n,p) for _ in 1:N]
	pmfEst = counts(data,0:n)/N
end

# ╔═╡ 3c412d30-2162-11eb-3931-e9ae8415ba38
begin
	plot( xGrid, pmfEst, 
		line=:stem, marker=:circle, 
		c=:blue, ms=10, msw=0, lw=4, label="MC estimate")
	plot!( xGrid, bPmf, 
		 line=:stem, marker=:xcross, c=:red, 
		 ms=6, msw=0, lw=2, label="PMF", xticks=(0:1:10),
		 ylims=(0,0.3), xlabel="x", ylabel="Probability")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.15"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═3c3fe880-2162-11eb-2efd-b53935597f04
# ╠═3c400b1c-2162-11eb-2196-09023e52b6af
# ╠═3c412d30-2162-11eb-3931-e9ae8415ba38
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
