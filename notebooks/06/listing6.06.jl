### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Statistics, DataFrames, CSV
	using Random, Distributions, Plots
	using HypothesisTests
	Random.seed!(0)
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.06"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	mu1, sig1, n1 = 0, 2, 8
	mu2, sig2, n2 = 0, 30, 15
	dist1 = Normal(mu1, sig1)
	dist2 = Normal(mu2, sig2)

	N = 10^4
	tdArray = Array{Tuple{Float64,Float64}}(undef,N)

	df(s1,s2,n1,n2) =
		(s1^2/n1 + s2^2/n2)^2 / ( (s1^2/n1)^2/(n1-1) + (s2^2/n2)^2/(n2-1) )
end;

# ╔═╡ fd06acdc-3b1d-11eb-1d5f-03f5cf0f595a
begin
	for i in 1:N
		x1Data = rand(dist1, n1)
		x2Data = rand(dist2, n2)
		x1Bar,x2Bar = mean(x1Data),mean(x2Data)
		s1,s2 = std(x1Data),std(x2Data)
		tStat = (x1Bar - x2Bar) / sqrt(s1^2/n1 + s2^2/n2)
		tdArray[i] = (tStat , df(s1,s2,n1,n2))
	end
	sort!(tdArray, by = first)

	invVal(v,i) = quantile(TDist(v),i/(N+1))

	xCoords  = Array{Float64}(undef,N)
	yCoords1 = Array{Float64}(undef,N)
	yCoords2 = Array{Float64}(undef,N)

	for i in 1:N
		xCoords[i] = first(tdArray[i])
		yCoords1[i] = invVal(last(tdArray[i]), i)
		yCoords2[i] = invVal(n1+n2-2, i)
	end
end;

# ╔═╡ fd06e9ae-3b1d-11eb-1646-d9c440ed4b98
begin
	scatter(xCoords, yCoords1, c=:blue, label="Calculated v", msw=0)
	scatter!(xCoords, yCoords2, c=:red, label="Fixed v", msw=0)
	plot!([-10,10], [-10,10],
		 c=:black, lw=0.3, xlims=(-8,8), ylims=(-8,8), ratio=:equal, label="", 
		 xlabel="Theoretical t-distribution quantiles", 
		 ylabel="Simulated t-distribution quantiles", legend=:topleft)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.06"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═fd06acdc-3b1d-11eb-1d5f-03f5cf0f595a
# ╠═fd06e9ae-3b1d-11eb-1646-d9c440ed4b98
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
