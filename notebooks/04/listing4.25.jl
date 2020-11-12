### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using StatsPlots, Distributions, CSV, DataFrames, Measures
	include(datadir("mvParams.jl"))
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.25"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
realData = CSV.read(datadir("temperatures.csv"));

# ╔═╡ 14d9ae82-2510-11eb-1223-13889002f669
begin
	N = 10^5
	biNorm = MvNormal(meanVect,covMat)
	syntheticData = DataFrame(rand(MvNormal(meanVect,covMat),N)')
	rename!(syntheticData,[:x1=>:Brisbane, :x2 => :GoldCoast])
end

# ╔═╡ 14d9e104-2510-11eb-3fe6-d3ca0f565047
begin
	default(c=cgrad([:blue, :red]), 
		xlabel="Brisbane Temperature", 
		ylabel="Gold Coast Temperature")

	p1 = marginalhist(realData.Brisbane, realData.GoldCoast, bins=10:45)
	p2 = marginalhist(syntheticData.Brisbane, syntheticData.GoldCoast, bins=10:.5:45)

	plot(p1,p2, size = (1000,500), margin = 10mm)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.25"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═14d9ae82-2510-11eb-1223-13889002f669
# ╠═14d9e104-2510-11eb-3fe6-d3ca0f565047
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
