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
md"## Listing 3.23"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	lambda, N = 1/3, 10^5
	bulbs = [1,10,50]
	xGrid = 0:0.1:10
	C = [:blue :red :green]
	dists = [Gamma(n,1/(n*lambda)) for n in bulbs]
end

# ╔═╡ 72a5caf8-2166-11eb-2bbd-41388c36dafb
function normalizedData(d::Gamma)
    sh = Int64(shape(d))
    data = [sum(-(1/(sh*lambda))*log.(rand(sh))) for _ in 1:N]
end

# ╔═╡ 72a5f870-2166-11eb-1c89-4948a68f9e26
L = [ "Shape = "*string.(shape.(i))*", Scale = "*
    string.(round.(scale.(i),digits=2)) for i in dists ]

# ╔═╡ 72a751e8-2166-11eb-14c1-53fba757ccfc
begin
	stephist( normalizedData.(dists), bins=50, 
		normed=:true, c=C, xlims=(0,maximum(xGrid)),ylims=(0,1), 
		xlabel="x", ylabel="Density", label="")
	plot!(xGrid, [pdf.(i,xGrid) for i in dists], c=C, label=reshape(L, 1,:))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.23"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═72a5caf8-2166-11eb-2bbd-41388c36dafb
# ╠═72a5f870-2166-11eb-1c89-4948a68f9e26
# ╠═72a751e8-2166-11eb-14c1-53fba757ccfc
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
