### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, StatsBase, Plots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.17"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	mu1, sigma1 = 10, 5
	mu2, sigma2 = 40, 12
	dist1, dist2 = Normal(mu1,sigma1), Normal(mu2,sigma2)
	p = 0.3
end

# ╔═╡ 233be730-24f8-11eb-377b-05c65af2dedf
mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)

# ╔═╡ 2366a6b4-24f8-11eb-3bf0-039e2a5f845f
mixCDF(x) = p*cdf(dist1,x) + (1-p)*cdf(dist2,x)

# ╔═╡ 23673158-24f8-11eb-2901-d7799dbb17ac
begin
	n = [30, 100]
	data1 = [mixRv() for _ in 1:n[1]]
	data2 = [mixRv() for _ in 1:n[2]]

	empiricalCDF1 = ecdf(data1)
	empiricalCDF2 = ecdf(data2)
end

# ╔═╡ 2375666c-24f8-11eb-037c-7d8b4a5129b3
begin
	xGrid = -10:0.1:80
	plot(xGrid,empiricalCDF1.(xGrid), c=:blue, label="ECDF with n = $(n[1])")
	plot!(xGrid,empiricalCDF2.(xGrid), c=:red, label="ECDF with n = $(n[2])")
	plot!(xGrid, mixCDF.(xGrid), c=:black, label="Underlying CDF",
		xlims=(-10,80), ylims=(0,1), 
		xlabel="x", ylabel="Probability", legend=:topleft)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.17"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═233be730-24f8-11eb-377b-05c65af2dedf
# ╠═2366a6b4-24f8-11eb-3bf0-039e2a5f845f
# ╠═23673158-24f8-11eb-2901-d7799dbb17ac
# ╠═2375666c-24f8-11eb-037c-7d8b4a5129b3
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
