### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Random, StatsBase, DataFrames, Plots, LaTeXStrings
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.26"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	alphas = [0.5, 1.5, 1]
	lam = 2

	lambda(dist::Weibull) = shape(dist)*scale(dist)^(-shape(dist))
	theta(lam,alpha) = (alpha/lam)^(1/alpha)

	dists = [Weibull.(a,theta(lam,a)) for a in alphas]

	hA(dist,x) = pdf(dist,x)/ccdf(dist,x)
	hB(dist,x) = lambda(dist)*x^(shape(dist)-1)
end

# ╔═╡ 884176a0-21c0-11eb-06f8-55964a60d533
begin
	xGrid = 0.01:0.01:10
	hazardsA = [hA.(d,xGrid) for d in dists]
	hazardsB = [hB.(d,xGrid) for d in dists]

	Text("Maximum difference between implementations: $(maximum(maximum.(hazardsA-hazardsB)))")
end

# ╔═╡ 8841a7b0-21c0-11eb-313a-bfa4eb49f351
begin
	Cl = [:blue :red :green]
	Lb = [L"\lambda=" * string(lambda(d)) * ",   " * L"\alpha =" * string(shape(d)) 
			for d in dists]

	plot(xGrid, hazardsA, c=Cl, label=reshape(Lb, 1,:), xlabel="x",
		ylabel="Instantaneous failure rate", xlims=(0,10), ylims=(0,10))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.26"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═884176a0-21c0-11eb-06f8-55964a60d533
# ╠═8841a7b0-21c0-11eb-313a-bfa4eb49f351
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
