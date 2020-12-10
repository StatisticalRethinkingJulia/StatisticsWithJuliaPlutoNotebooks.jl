### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, StatsBase, Distributions, Plots, LaTeXStrings
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.16"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	mu0, mu1a, mu1b, mu1c, sd = 15, 16, 18, 20, 2
	tauGrid = 5:0.1:25

	dist0 = Normal(mu0,sd)
	dist1a, dist1b, dist1c  = Normal(mu1a,sd), Normal(mu1b,sd), Normal(mu1c,sd)

	falsePositive = ccdf.(dist0,tauGrid)
	truePositiveA, truePositiveB, truePositiveC = 
	    ccdf.(dist1a,tauGrid), ccdf.(dist1b,tauGrid), ccdf.(dist1c,tauGrid)
end

# ╔═╡ a80f7e58-3af9-11eb-04b3-57fcb9ee857c
begin
	plot(falsePositive, [truePositiveA truePositiveB truePositiveC], 
		c=[:blue :red :green], 
		label=[L"H1a: \mu_1 = 16" L"H1b: \mu_1 = 18" L"H1c: \mu_1 = 20"])
	plot!([0,1], [0,1], c=:black, ls=:dash, label="H0 = H1 = 15", 
		xlims=(0,1), ylims=(0,1), xlabel=L"\alpha", ylabel="Power", 
		ratio=:equal, legend=:bottomright)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.16"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═a80f7e58-3af9-11eb-04b3-57fcb9ee857c
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
