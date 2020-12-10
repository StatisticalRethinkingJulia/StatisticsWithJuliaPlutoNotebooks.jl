### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Combinatorics, Statistics, DataFrames, CSV
	using Random, Distributions, Plots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.17"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = CSV.read(datadir("fertilizer.csv"), DataFrame; delim=",")
	control = data.Control
	fertilizer = data.FertilizerX
end;

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
subGroups = collect(combinations([control;fertilizer],10))

# ╔═╡ 1aa451f0-3afa-11eb-2bb1-65c72b577797
begin
	meanFert = mean(fertilizer)
	pVal = sum([mean(i) >= meanFert for i in subGroups])/length(subGroups)
	Text("p-value = $(pVal)")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.17"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═1aa451f0-3afa-11eb-2bb1-65c72b577797
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
