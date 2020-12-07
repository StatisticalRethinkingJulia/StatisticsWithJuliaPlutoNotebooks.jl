### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, StatsBase, DataFrames, Plots
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.1"

# ╔═╡ e4591176-1eca-11eb-1e04-15ae5da7dbb0


# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	names = ["Mary","Mel","David","John","Kayley","Anderson"]
	randomName() = rand(names)
	X = 3:8
	N = 10^6
	sampleLengths = [length(randomName()) for _ in 1:N]
end;

# ╔═╡ 6c3d1d9e-1f6b-11eb-3d29-3d9260020721
bar(X,counts(sampleLengths)/N, ylims=(0,0.35),
    xlabel="Name length", ylabel="Estimated p(x)", legend=:none)

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.1"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═e4591176-1eca-11eb-1e04-15ae5da7dbb0
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═6c3d1d9e-1f6b-11eb-3d29-3d9260020721
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
