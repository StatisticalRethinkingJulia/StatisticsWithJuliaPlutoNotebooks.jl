### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, StatsBase, DataFrames
	Random.seed!(1)
end

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.7"

# ╔═╡ c4bef1a4-1ee9-11eb-0b58-8be033f6fbad
begin
	A = Set(['a','e','i','o','u'])
	B = Set(['x','y','z'])
	omega = 'a':'z'
	N = 10^6
end

# ╔═╡ 23c4c304-1eea-11eb-2a57-d9b2e99a3253
begin
	df = DataFrame()
	for _ in 1:5
    	mcEst1 = sum([in(sample(omega),A) || in(sample(omega),B) for _ in 1:N])/N
    	mcEst2 = sum([in(sample(omega),union(A,B)) for _ in 1:N])/N
    	append!(df, DataFrame(:mcEst1 => mcEst1, :mcEst2 => mcEst2))
	end
	df
end

# ╔═╡ 6285dea2-1ee5-11eb-2b6a-f9906c0d3351
md"## End of listing 2.7"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═c4bef1a4-1ee9-11eb-0b58-8be033f6fbad
# ╠═23c4c304-1eea-11eb-2a57-d9b2e99a3253
# ╟─6285dea2-1ee5-11eb-2b6a-f9906c0d3351
