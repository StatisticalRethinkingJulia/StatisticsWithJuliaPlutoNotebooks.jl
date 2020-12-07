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
md"## Listing 3.21"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	cUnif = Uniform(0,2π)
	xGrid, N = 0:0.1:2π, 10^6
end

# ╔═╡ 287be85a-2165-11eb-2609-eba593feae95
begin
	stephist( rand(N)*2π, bins=xGrid, 
		normed=:true, c=:blue, 
		label="MC Estimate")
	plot!( xGrid, pdf.(cUnif,xGrid), 
		c=:red,ylims=(0,0.2),label="PDF", ylabel="Density",xticks=([0:π/2:2π;],
		["0", L"\dfrac{\pi}{2}", L"\pi", L"\dfrac{3\pi}{2}", L"2\pi"]))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.21"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═287be85a-2165-11eb-2609-eba593feae95
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
