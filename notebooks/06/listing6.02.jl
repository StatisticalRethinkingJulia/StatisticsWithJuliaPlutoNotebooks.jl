### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Statistics, DataFrames, CSV
	using Random, Distributions, Plots
	using HypothesisTests
	Random.seed!(0)
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.02"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	data = CSV.read(datadir("machine1.csv"), DataFrame; header=false)[:,1]
	xBar, n = mean(data), length(data)
	s = std(data)
	alpha = 0.1
	t = quantile(TDist(n-1),1-alpha/2)

	Text("Calculating formula: $((xBar - t*s/sqrt(n), xBar + t*s/sqrt(n)))")
end

# ╔═╡ 88f0e5d6-3b0b-11eb-0af9-b964a1170ff3
Text("Using confint() function: $(confint(OneSampleTTest(xBar,s,n),alpha))")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.02"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═88f0e5d6-3b0b-11eb-0af9-b964a1170ff3
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
