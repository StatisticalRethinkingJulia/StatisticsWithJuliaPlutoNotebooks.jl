### A Pluto.jl notebook ###
# v0.12.11

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Random, StatsBase, DataFrames, Plots
	Random.seed!(1)
	include(datadir("mvParams.jl"))
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.34"

# ╔═╡ a64855e4-2e89-11eb-11e7-79624219151b
meanVect

# ╔═╡ b14a292c-2e89-11eb-3cd0-2bed0aa6037d
covMat

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
biNorm = MvNormal(meanVect, covMat)

# ╔═╡ 52aba0a8-2e89-11eb-2638-a5e8aec2d22e
rand(biNorm, 10)

# ╔═╡ a71a7f10-2290-11eb-3cc0-3b6d0e5fa6d0
begin
	N = 10^3
	points = rand(MvNormal(meanVect,covMat),N)

	support = 15:0.5:40
	z = [ pdf(biNorm,[x,y]) for y in support, x in support ]
end;

# ╔═╡ a71abdcc-2290-11eb-0683-5d9b8f53e51d
begin
	p1 = scatter(points[1,:], points[2,:], ms=0.5, c=:black, legend=:none)
	p1 = contour!(support, support, z, 
			levels=[0.001, 0.005, 0.02], c=[:blue, :red, :green], 
			xlims=(15,40), ylims=(15,40), ratio=:equal, legend=:none, 
			xlabel="x", ylabel="y")
end;

# ╔═╡ c92aa622-2293-11eb-3afe-3da4f7d14f3d
begin
	p2 = surface(support, support, z, lw=0.2, #c=cgrad([:blue, :red]),
			 legend=:none, xlabel="x", ylabel="y")
	plot(p1, p2, size=(800,400))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.34"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═a64855e4-2e89-11eb-11e7-79624219151b
# ╠═b14a292c-2e89-11eb-3cd0-2bed0aa6037d
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═52aba0a8-2e89-11eb-2638-a5e8aec2d22e
# ╠═a71a7f10-2290-11eb-3cc0-3b6d0e5fa6d0
# ╠═a71abdcc-2290-11eb-0683-5d9b8f53e51d
# ╠═c92aa622-2293-11eb-3afe-3da4f7d14f3d
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
