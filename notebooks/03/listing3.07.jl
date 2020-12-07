### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Statistics, Random, StatsBase, DataFrames, Plots
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.7"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	dist1 = TriangularDist(0,1,1)
	dist2 = TriangularDist(0,1,0)
	N=10^6

	data1, data2 = rand(dist1,N), rand(dist2,N)
	dataSum = data1 + data2
end

# ╔═╡ 8f60b2f6-20f9-11eb-0a66-771e655035a3
mgf(s) = 4(1+(s-1)*MathConstants.e^s)*(MathConstants.e^s-1-s)/s^4

# ╔═╡ 8f61044a-20f9-11eb-1485-d145145c4c57
mgfPointEst(s) = mean([MathConstants.e^(s*z) for z in 
					rand(dist1,20) + rand(dist2,20)])

# ╔═╡ 8f6181a4-20f9-11eb-3eae-6dc331b9a88a
begin
	p1 = histogram(dataSum, bins=80, normed=:true, 
		ylims=(0,1.4), xlabel="z", ylabel="PDF")

	sGrid = -1:0.01:1
	p2 = plot(sGrid, mgfPointEst.(sGrid), c=:blue, ylims=(0,3.5))
	p2 = plot!(sGrid, mgf.(sGrid), c=:red)
	p2 = plot!( [minimum(sGrid),maximum(sGrid)], 
		[minimum(sGrid),maximum(sGrid)].+1, 
		c=:black, xlabel="s", ylabel="MGF")

	plot(p1, p2, legend=:none, size=(800, 400))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.7"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═8f60b2f6-20f9-11eb-0a66-771e655035a3
# ╠═8f61044a-20f9-11eb-1485-d145145c4c57
# ╠═8f6181a4-20f9-11eb-3eae-6dc331b9a88a
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
