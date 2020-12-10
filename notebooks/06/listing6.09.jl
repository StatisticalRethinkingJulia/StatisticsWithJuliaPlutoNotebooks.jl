### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, Plots, Measures
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.09"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	N = 5*10^3
	alpha = 0.05
	confLevel = 1 - alpha
	z = quantile(Normal(),1-alpha/2) 
end;

# ╔═╡ 7e997ce4-3b27-11eb-167a-f74a6dff6b1c
function randCI(n,p)
    sample = rand(n) .< p
    pHat = sum(sample)/n 
    serr = sqrt(pHat*(1-pHat)/n)
    (pHat - z*serr, pHat + z*serr) 
end

# ╔═╡ 7e99af3e-3b27-11eb-2b94-051fc56f27cf
cover(p,ci) = ci[1] <= p && p <= ci[2]

# ╔═╡ 7e9a284c-3b27-11eb-37b2-6fcc5cbb3adb
begin
	pGrid = 0.1:0.01:0.9
	nGrid = 5:1:50
	errs = zeros(length(nGrid),length(pGrid))

	for i in 1:length(nGrid)
		for j in 1:length(pGrid)
			Random.seed!(0)
			n, p = nGrid[i], pGrid[j]
			coverageRatio = sum([cover(p,randCI(n,p)) for _ in 1:N])/N
			errs[i,j] = confLevel - coverageRatio
		end
	end
end;

# ╔═╡ 7ea98df0-3b27-11eb-292f-4d1335c99239
begin
	default(xlabel = "p", ylabel = "n", 
		xticks =([1:5:length(pGrid);], minimum(pGrid):0.05:maximum(pGrid)),
		yticks =([1:5:length(nGrid);], minimum(nGrid):5:maximum(nGrid)))

	p1 = heatmap(errs, c=cgrad([:white, :black]))
	p2 = heatmap(abs.(errs) .<= 0.04, legend = false, c=cgrad([:black, :white]))
	plot(p1,p2, size = (1000,400), margin = 5mm)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.09"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═7e997ce4-3b27-11eb-167a-f74a6dff6b1c
# ╠═7e99af3e-3b27-11eb-2b94-051fc56f27cf
# ╠═7e9a284c-3b27-11eb-37b2-6fcc5cbb3adb
# ╠═7ea98df0-3b27-11eb-292f-4d1335c99239
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
