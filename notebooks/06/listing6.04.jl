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
md"## Listing6.03"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data1 = CSV.read(datadir("machine1.csv"), DataFrame; delim=",")[:, 1]
	data2 = CSV.read(datadir("machine2.csv"), DataFrame; delim=",")[:, 1]
end;

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	xBar1, xBar2 = mean(data1), mean(data2)
	n1, n2 = length(data1), length(data2)
	alpha = 0.05
	t = quantile(TDist(n1+n2-2),1-alpha/2)

	s1, s2 = std(data1), std(data2)
	sP = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2) / (n1+n2-2))

	Text("Calculating formula: $((xBar1 - xBar2 - t*sP* sqrt(1/n1 + 1/n2),
		xBar1 - xBar2 + t*sP* sqrt(1/n1 + 1/n2)))")
end

# ╔═╡ 1b68b272-3b0c-11eb-013c-651a9f49938b
Text("Using confint(): $(confint(EqualVarianceTTest(data1,data2),alpha))")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.03"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═1b68b272-3b0c-11eb-013c-651a9f49938b
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
