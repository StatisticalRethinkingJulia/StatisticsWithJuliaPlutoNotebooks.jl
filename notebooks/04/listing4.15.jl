### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, StatsPlots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.15"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	mu1, sigma1 = 10, 5
	mu2, sigma2 = 40, 12
	dist1, dist2 = Normal(mu1,sigma1), Normal(mu2,sigma2)
	p = 0.3
	mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)

	n = 2000
	data = [mixRv() for _ in 1:n]
end

# ╔═╡ cd520f9c-2509-11eb-36ce-8340182a95eb
begin
	density(data, c=:blue, label="Density via StatsPlots", 
			xlims=(-20,80), ylims=(0,0.035))
	stephist!(data, bins=50, c=:black, norm=true, 
		label="Histogram", xlabel="x", ylabel = "Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.15"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═cd520f9c-2509-11eb-36ce-8340182a95eb
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
