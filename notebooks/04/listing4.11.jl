### A Pluto.jl notebook ###
# v0.12.9

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using CSV, Statistics, StatsBase
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.11"

# ╔═╡ 3ca0a9a2-2448-11eb-1fa7-c73c89f82bab
df = CSV.read(datadir("temperatures.csv"))

# ╔═╡ 5da275a4-2448-11eb-0c25-1933e02eaadd
describe(df)

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
data = df[:,4];

# ╔═╡ d7ac71b6-2447-11eb-1d63-bf75cc1595ca
summarystats(data)

# ╔═╡ b2a270b4-2447-11eb-26b1-ebbdddd0556a
("Sample Mean: ", mean(data))

# ╔═╡ d9589e04-2447-11eb-1f3c-ef2e542f4a7e
("Harmonic <= Geometric <= Arithmetic ", 
	(harmmean(data), geomean(data), mean(data)))

# ╔═╡ d958d18a-2447-11eb-2bdb-59355bf3b2c0
("Sample Variance: ",var(data))

# ╔═╡ d9596406-2447-11eb-1b4a-ad22e9d7577f
("Sample Standard Deviation: ",std(data))

# ╔═╡ d966f3a8-2447-11eb-2d06-45316fa05a0c
("Minimum: ", minimum(data))

# ╔═╡ d9678c0a-2447-11eb-390c-036d2ad8849d
("Maximum: ", maximum(data))

# ╔═╡ d971de78-2447-11eb-1f5d-6f11232976cd
("Median: ", median(data))

# ╔═╡ d97b6922-2447-11eb-0c9d-bd20bee15854
("95th percentile: ", percentile(data, 95))

# ╔═╡ d97c458e-2447-11eb-30c5-9513d1e521fe
("0.95 quantile: ", quantile(data, 0.95))

# ╔═╡ d98b79bc-2447-11eb-023b-ef60bc1a50ab
("Interquartile range: ", iqr(data),"\n")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.11"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═3ca0a9a2-2448-11eb-1fa7-c73c89f82bab
# ╠═5da275a4-2448-11eb-0c25-1933e02eaadd
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═d7ac71b6-2447-11eb-1d63-bf75cc1595ca
# ╠═b2a270b4-2447-11eb-26b1-ebbdddd0556a
# ╠═d9589e04-2447-11eb-1f3c-ef2e542f4a7e
# ╠═d958d18a-2447-11eb-2bdb-59355bf3b2c0
# ╠═d9596406-2447-11eb-1b4a-ad22e9d7577f
# ╠═d966f3a8-2447-11eb-2d06-45316fa05a0c
# ╠═d9678c0a-2447-11eb-390c-036d2ad8849d
# ╠═d971de78-2447-11eb-1f5d-6f11232976cd
# ╠═d97b6922-2447-11eb-0c9d-bd20bee15854
# ╠═d97c458e-2447-11eb-30c5-9513d1e521fe
# ╠═d98b79bc-2447-11eb-023b-ef60bc1a50ab
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
