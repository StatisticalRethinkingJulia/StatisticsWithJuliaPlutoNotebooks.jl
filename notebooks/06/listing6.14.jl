### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, DataFrames, Plots
	Random.seed!(0)
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.14"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	lambda = 0.1
	dist = Exponential(1/lambda)
	actualMedian = median(dist)

	M = 10^3
	N = 10^4
	nRange = 2:2:10
	alpha = 0.05
end

# ╔═╡ fba0be84-3b2f-11eb-1e0f-5f8a1f264dba
begin
	df = DataFrame()
	for n in nRange
		coverageCount = 0
		for _ in 1:M
			sampleData = rand(dist, n)
			bootstrapSampleMeans = [median(rand(sampleData, n)) for _ in 1:N]
			L = quantile(bootstrapSampleMeans, alpha/2)
			U = quantile(bootstrapSampleMeans, 1-alpha/2)
			coverageCount += L < actualMedian && actualMedian < U
		end
		append!(df, DataFrame(:n => n, :coverage => coverageCount/M))
	end
	df
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.14"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═fba0be84-3b2f-11eb-1e0f-5f8a1f264dba
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
