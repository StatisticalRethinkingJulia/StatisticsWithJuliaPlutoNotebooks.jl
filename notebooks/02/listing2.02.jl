### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, StatsBase, DataFrames
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 2.2"

# ╔═╡ 6ffea8a0-1ea1-11eb-1991-61c054bcac44
begin
	A = Set(['a','e','i','o','u'])
	B = Set(['x','y','z'])
	omega = 'a':'z'

	N = 10^6
end;

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	df = DataFrame()
	local mcEst1, mcEst2
	for _ in 1:5
    	mcEst1 = sum([in(sample(omega),A) || in(sample(omega),B) for _ in 1:N])/N
    	mcEst2 = sum([in(sample(omega),union(A,B)) for _ in 1:N])/N
		append!(df, DataFrame(:mcEst1 => mcEst1, :mcEst2 => mcEst2))
	end
	df
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 2.2"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═6ffea8a0-1ea1-11eb-1991-61c054bcac44
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
