### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Random, StatsBase, StatsPlots
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.11"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
dist1 = TriangularDist(0,10,5)

# ╔═╡ 75c334f0-2134-11eb-132d-dfcb59e14474
dist2 = DiscreteUniform(1,5)

# ╔═╡ 75c37638-2134-11eb-150e-a5788c7f72a7
theorMean1, theorMean2 = mean(dist1), mean(dist2)

# ╔═╡ 75c3fa78-2134-11eb-0259-699e1c89a023
begin
	N = 10^6
	data1 = rand(dist1,N)
	data2 = rand(dist2,N)
	estMean1, estMean2 = mean(data1), mean(data2)
end

# ╔═╡ de66cfee-2134-11eb-2c7a-add4bee67341
density(data1, lab="Triangukar density")

# ╔═╡ a315bbee-2134-11eb-0249-17f3c6af3543
density!(data2, lab="Discrete Uniform density")

# ╔═╡ 75cedfbc-2134-11eb-3b3c-5bdc69e4735a
Text("Symmetric Triangular Distiribution on [0,10] has mean $theorMean1
	(estimated: $estMean1)")

# ╔═╡ 75cf627a-2134-11eb-0dc9-e5e3d869f4a8
Text("Discrete Uniform Distiribution on {1,2,3,4,5} has mean $theorMean2
	(estimated: $estMean2)")

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.11"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═75c334f0-2134-11eb-132d-dfcb59e14474
# ╠═75c37638-2134-11eb-150e-a5788c7f72a7
# ╠═75c3fa78-2134-11eb-0259-699e1c89a023
# ╠═de66cfee-2134-11eb-2c7a-add4bee67341
# ╠═a315bbee-2134-11eb-0249-17f3c6af3543
# ╠═75cedfbc-2134-11eb-3b3c-5bdc69e4735a
# ╠═75cf627a-2134-11eb-0dc9-e5e3d869f4a8
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
