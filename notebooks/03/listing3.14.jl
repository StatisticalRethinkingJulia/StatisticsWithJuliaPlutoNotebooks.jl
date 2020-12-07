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
md"## Listing 3.14"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	faces, N = 1:6, 10^6
	mcEstimate = counts(rand(faces,N), faces)/N
end

# ╔═╡ b93d18b8-2161-11eb-299b-0d801d262dd3
begin
	plot(faces, mcEstimate, 
		line=:stem, marker=:circle, 
		c=:blue, ms=10, msw=0, lw=4, label="MC estimate")
	plot!([i for i in faces], [1/6 for _ in faces], 
		line=:stem, marker=:xcross, c=:red, 
		ms=6, msw=0, lw=2, label="PMF", 
		xlabel="Face number", ylabel="Probability", ylims=(0,0.22))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.14"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═b93d18b8-2161-11eb-299b-0d801d262dd3
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
