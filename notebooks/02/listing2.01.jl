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
md"## Listing 2.1"

# ╔═╡ e4591176-1eca-11eb-1e04-15ae5da7dbb0


# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	df = DataFrame()
	for n in 4:7
		N, faces = 10^n, 1:6

		numSol = sum([iseven(i+j) for i in faces, j in faces]) / length(faces)^2
		mcEst  = sum([iseven(rand(faces) + rand(faces)) for i in 1:N]) / N

		append!(df, DataFrame(:n => n, :N => N, :numsol => numSol, :mcEst => mcEst))
	end
	df
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 2.1"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═e4591176-1eca-11eb-1e04-15ae5da7dbb0
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
