### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Statistics
	using Random, Distributions, Plots
	Random.seed!(0)
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.15"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	mu, sig = 50, 5
	dist = Normal(mu, sig)
	alpha = 0.01
	nMax = 40

	observations = rand(dist,1)
	piLarray, piUarray = [], []
end;

# ╔═╡ 0e5aed16-3b2f-11eb-2f7c-01f450cc5336
for _ in 2:nMax
    xNew = rand(dist)
    push!(observations,xNew)

    xbar, sd = mean(observations), std(observations)
    n = length(observations)
    tVal = quantile(TDist(n-1),1-alpha/2)
    delta = tVal * sd * sqrt(1+1/n)
    piL, piU = xbar - delta, xbar + delta
    
    push!(piLarray,piL); push!(piUarray,piU)
end

# ╔═╡ 0e5b22c2-3b2f-11eb-2895-7d6e7267e6b6
begin
	scatter(1:nMax, observations, 
		c=:blue, msw=0, label="Observations")
	plot!(2:nMax, piUarray, 
		c=:red, shape=:xcross, msw=0, label="Prediction Interval")
	plot!(2:nMax, piLarray, 
		c=:red, shape=:xcross, msw=0, label="", 
		ylims=(0,100), xlabel="Number of observations", ylabel="Value")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.15"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═0e5aed16-3b2f-11eb-2f7c-01f450cc5336
# ╠═0e5b22c2-3b2f-11eb-2895-7d6e7267e6b6
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
