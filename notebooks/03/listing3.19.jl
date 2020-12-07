### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Random, StatsBase, DataFrames, Plots
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.19"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
function prn(lambda)
    k, p = 0, 1
    while p > MathConstants.e^(-lambda)
        k += 1
        p *= rand()
    end
    return k-1
end

# ╔═╡ 0cbc946e-2164-11eb-1b0c-7d4c7a607b1e
begin
	xGrid, lambda, N = 0:16, 5.5, 10^6

	pDist = Poisson(lambda)
	bPmf = pdf.(pDist,xGrid)
	data = counts([prn(lambda) for _ in 1:N],xGrid)/N
end

# ╔═╡ 0cbcbdf2-2164-11eb-193d-2baa8a6bce0b
begin
	plot( xGrid, data, 
		line=:stem, marker=:circle, 
		c=:blue, ms=10, msw=0, lw=4, label="MC estimate")
	plot!( xGrid, bPmf, line=:stem, 
		marker=:xcross, c=:red, ms=6, msw=0, lw=2, label="PMF",
		ylims=(0,0.2), xlabel="x", ylabel="Probability of x events")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.19"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═0cbc946e-2164-11eb-1b0c-7d4c7a607b1e
# ╠═0cbcbdf2-2164-11eb-193d-2baa8a6bce0b
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
