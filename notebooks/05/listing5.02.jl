### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, Plots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.02"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	mu, sigma = 10, 4
	n, N = 10, 10^6

	sMeans = Array{Float64}(undef, N)
	sVars  = Array{Float64}(undef, N)
	tStats = Array{Float64}(undef, N)

	for i in 1:N
		data       = rand(Normal(mu,sigma),n)
		sampleMean = mean(data)
		sampleVars = var(data)
		sMeans[i]  = sampleMean
		sVars[i]   = sampleVars
		tStats[i]  = (sampleMean - mu)/(sqrt(sampleVars/n))
	end

	xRangeMean = 5:0.1:15
	xRangeVar = 0:0.1:60
	xRangeTStat = -5:0.1:5
end

# ╔═╡ 94ec1808-2529-11eb-35ba-e9565c6cdbc1
begin
	p1 = stephist(sMeans, bins=50, c=:blue, normed=true, legend=false)
	p1 = plot!(xRangeMean, pdf.(Normal(mu,sigma/sqrt(n)), xRangeMean),
		c=:red, xlims=(5,15), ylims=(0,0.35), xlabel="Sample mean",ylabel="Density")
	p2 = stephist(sVars, bins=50, c=:blue, normed=true, label="Simulated")
	p2 = plot!(xRangeVar, (n-1)/sigma^2*pdf.(Chisq(n-1), xRangeVar*(n-1)/sigma^2),
		c=:red, label="Analytic", xlims=(0,60), ylims=(0,0.06),
		xlabel="Sample Variance",ylabel="Density")
	p3 = stephist(tStats, bins=100, c=:blue, normed=true, legend=false)
	p3 = plot!(xRangeTStat, pdf.(TDist(n-1), xRangeTStat), 
		c=:red, xlims=(-5,5), ylims=(0,0.4), xlabel="t-statistic",ylabel="Density")

	plot(p1, p2, p3, layout = (1,3), size=(1200, 600))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.02"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═94ec1808-2529-11eb-35ba-e9565c6cdbc1
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
