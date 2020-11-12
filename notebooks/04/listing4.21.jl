### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, StatsPlots, Plots, Measures
	Random.seed!(0)
 end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.21"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	b1, b2 = 0.5 , 2
	dist1, dist2, = Beta(b1,b1), Beta(b2,b2)

	n = 2000
	data1 = rand(dist1,n)
	data2 = rand(dist2,n)
end

# ╔═╡ 65067674-250d-11eb-12ab-f7aeb1fb1a16
begin
	stephist(data1, bins=15, label = "beta($b1,$b1)", c = :red, normed = true)
	p1 = stephist!(data2, bins=15, label = "beta($b2,$b2)",
			c = :blue, xlabel="x", ylabel="Density",normed = true)

	p2 = qqplot(data1, data2, c=:black, ms=1, msw =0,
			xlabel="Quantiles for beta($b1,$b1) sample",
			ylabel="Quantiles for beta($b2,$b2) sample",
			legend=false)

	plot(p1, p2, size=(800,400), margin = 5mm)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.21"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═65067674-250d-11eb-12ab-f7aeb1fb1a16
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
