### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ e77948a6-1ecc-11eb-3285-7f06dcdb7cf5
using Pkg, DrWatson

# ╔═╡ e7799b9e-1ecc-11eb-311f-035de72c3603
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using StatsBase, Combinatorics, Plots
end

# ╔═╡ 6c38d2ce-1ecc-11eb-281d-0d13a832adea
md"## Listing 2.3"

# ╔═╡ fe1ee6a6-1ecc-11eb-1930-0301940bc5f7
	N = 10^3

# ╔═╡ e77a2a28-1ecc-11eb-0acb-5167936362f5
begin
	matchExists1(n) = 1 - prod([k/365 for k in 365:-1:365-n+1])
	matchExists2(n) = 1- factorial(365,365-big(n))/365^big(n)

	function bdEvent(n)
		birthdays = rand(1:365,n)
		dayCounts = counts(birthdays, 1:365)
		return maximum(dayCounts) > 1
	end

	probEst(n) = sum([bdEvent(n) for _ in 1:N])/N
end

# ╔═╡ e7885e54-1ecc-11eb-03d1-2580aad82a3d
begin
	xGrid = 1:50
	analyticSolution1 = [matchExists1(n) for n in xGrid]
	analyticSolution2 = [matchExists2(n) for n in xGrid]
	("Maximum error: $(round(maximum(abs.(analyticSolution1 - analyticSolution2)), digits=25))")
end

# ╔═╡ e788edce-1ecc-11eb-3682-b1bfc98646a0
begin
	mcEstimates = [probEst(n) for n in xGrid]

	plot(xGrid, analyticSolution1, c=:blue, label="Analytic solution")
	scatter!(xGrid, mcEstimates, c=:red, ms=6, msw=0, shape=:xcross, 
		label="MC estimate", xlims=(0,50), ylims=(0, 1), 
		xlabel="Number of people in room", 
		ylabel="Probability of birthday match", 
		legend=:topleft)
end

# ╔═╡ e7965b58-1ecc-11eb-2308-093c9f5a167e
md"## End of listing 2.3"

# ╔═╡ Cell order:
# ╟─6c38d2ce-1ecc-11eb-281d-0d13a832adea
# ╠═e77948a6-1ecc-11eb-3285-7f06dcdb7cf5
# ╠═e7799b9e-1ecc-11eb-311f-035de72c3603
# ╠═fe1ee6a6-1ecc-11eb-1930-0301940bc5f7
# ╠═e77a2a28-1ecc-11eb-0acb-5167936362f5
# ╠═e7885e54-1ecc-11eb-03d1-2580aad82a3d
# ╠═e788edce-1ecc-11eb-3682-b1bfc98646a0
# ╟─e7965b58-1ecc-11eb-2308-093c9f5a167e
