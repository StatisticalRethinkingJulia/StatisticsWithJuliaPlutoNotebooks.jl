### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV
	using Random, Distributions, Plots
	Random.seed!(0)
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.13"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	sampleData = CSV.read(datadir("machine1.csv"), DataFrame; delim=",")[:, 1]
end;

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	n, N = length(sampleData), 10^6
	alpha = 0.1

	bootstrapSampleMeans = [mean(rand(sampleData, n)) for i in 1:N]
	Lmean = quantile(bootstrapSampleMeans, alpha/2)
	Umean = quantile(bootstrapSampleMeans, 1-alpha/2)

	bootstrapSampleMedians = [median(rand(sampleData, n)) for i in 1:N]
	Lmed = quantile(bootstrapSampleMedians, alpha/2)
	Umed = quantile(bootstrapSampleMedians, 1-alpha/2)

	Text("Bootstrap confidence interval for the mean: $((Lmean, Umean))")
end

# ╔═╡ 503bce92-3b2c-11eb-02b5-17d205eea2d3
Text("Bootstrap confidence interval for the median: $((Lmed, Umed))")

# ╔═╡ 503c061e-3b2c-11eb-1658-494999a7c6b2
begin
	stephist(bootstrapSampleMeans, bins=1000, c=:blue,
		normed=true, label="Sample \nmeans")
	plot!([Lmean, Lmean],[0,2], c=:black, ls=:dash, label="90% CI")
	plot!([Umean, Umean],[0,2],c=:black, ls=:dash, label="",
		xlims=(52,54), ylims=(0,2), xlabel="Sample Means", ylabel="Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.13"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═503bce92-3b2c-11eb-02b5-17d205eea2d3
# ╠═503c061e-3b2c-11eb-1658-494999a7c6b2
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
