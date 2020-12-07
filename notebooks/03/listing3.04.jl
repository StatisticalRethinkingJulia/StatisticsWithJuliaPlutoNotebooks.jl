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
md"## Listing 3.4"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	dist = TriangularDist(4,6,5)
	N = 10^6
	data = rand(dist,N)
	yData=(data .- 5).^2
end

# ╔═╡ 0b18657a-1f96-11eb-0dbe-614426f96594
("Mean: $(mean(yData)), Variance: $(var(data))")

# ╔═╡ 0b18a3f0-1f96-11eb-1f2b-0f12d42055fa
begin
	p1 = histogram(data, xlabel="x", bins=80, normed=true, ylims=(0,1.1))
	p2 = histogram(yData, xlabel="y", bins=80, normed=true, ylims=(0,15))
	plot(p1, p2, ylabel="Proportion", size=(800, 400), legend=:none)
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.4"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═0b18657a-1f96-11eb-0dbe-614426f96594
# ╠═0b18a3f0-1f96-11eb-1f2b-0f12d42055fa
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
