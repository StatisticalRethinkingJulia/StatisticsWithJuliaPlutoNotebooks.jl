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
md"## Listing 3.29"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
Z() = sqrt(-2*log(rand()))*cos(2*pi*rand())

# ╔═╡ 0000b90c-21c2-11eb-2426-fdbaf4727f0c
begin
	xGrid = -4:0.01:4

	histogram([Z() for _ in 1:10^6], bins=50, 
			normed=true, label="MC estimate")
	plot!(xGrid, pdf.(Normal(),xGrid), 
		 c=:red, lw=4, label="PDF", 
		 xlims=(-4,4), ylims=(0,0.5), xlabel="x", ylabel="f(x)")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.29"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═0000b90c-21c2-11eb-2426-fdbaf4727f0c
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
