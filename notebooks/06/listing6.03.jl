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
	data = CSV.read(datadir("machine1.csv"), DataFrame; delim=",")[:, 1]
end;

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	xBar, n = mean(data), length(data)
	sig = 1.2
	alpha = 0.1
	z = quantile(Normal(),1-alpha/2)

	Text("Calculating formula: $((xBar - z*sig/sqrt(n), xBar + z*sig/sqrt(n)))")
end

# ╔═╡ c69d5eae-3b0c-11eb-38aa-b578cce81150
Text("Using confint() function: $(confint(OneSampleZTest(xBar,sig,n),alpha))")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.03"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═c69d5eae-3b0c-11eb-38aa-b578cce81150
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
