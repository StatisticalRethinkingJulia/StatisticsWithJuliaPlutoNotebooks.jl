### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, StatsPlots, Plots
	Random.seed!(0)
 end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.18"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	mu = 20
	d1, d2 = Normal(mu,mu), Exponential(mu)
 
	n = 100
	data1 = rand(d1,n)
	data2 = rand(d2,n)
end

# ╔═╡ bdabe54e-250a-11eb-1714-25afa772347e
begin
	qqnorm(data1, c=:blue, ms=3, msw=0, label="Normal Data")
	qqnorm!(data2, c=:red, ms=3, msw=0, label="Exponential Data",
			xlabel="Normal Theoretical Quantiles",
			ylabel="Data Quantiles", legend=true)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.18"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═bdabe54e-250a-11eb-1714-25afa772347e
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
