### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, StatsBase, DataFrames, Plots
	using Distributions, LinearAlgebra, LaTeXStrings
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.32"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	N = 10^4

	SigY = [ 6 4 ;
			 4 9]
	muY = [15 ; 
		   20]
	A = cholesky(SigY).L

	rngGens = [()->rand(Normal()), 
			   ()->rand(Uniform(-sqrt(3),sqrt(3))),
			   ()->rand(Exponential())-1]

	rv(rg) = A*[rg(),rg()] + muY

	data = [[rv(r) for _ in 1:N] for r in rngGens]
end

# ╔═╡ e752604c-2211-11eb-36e4-9d0ca870afa5
stats(data) = begin
    data1, data2 = first.(data),last.(data)
    (
		round(mean(data1),digits=2),
		round(mean(data2),digits=2),
    	round(var(data1),digits=2), 
		round(var(data2),digits=2),
        round(cov(data1,data2),digits=2)
	)
end

# ╔═╡ e753223c-2211-11eb-1b21-77985295723c
begin
	df = DataFrame()
	for d in data
		r = stats(d)
		append!(df, DataFrame(:Mean1 => r[1], :Mean2 => r[2], :Var1 => r[3],
				:Var2 => r[4], :Cov => r[5]))
	end
	df
end

# ╔═╡ e75f86ee-2211-11eb-24b6-3921f08d4bfd
begin
	scatter(first.(data[1]), last.(data[1]), c=:blue, ms=1, msw=0, label="Normal")
	scatter!(first.(data[2]), last.(data[2]), c=:red, ms=1, msw=0, label="Uniform")
	scatter!(first.(data[3]),last.(data[3]),c=:green, ms=1,msw=0,label="Exponential",
		xlims=(0,40), ylims=(0,40), legend=:bottomright, ratio=:equal,
		xlabel=L"X_1", ylabel=L"X_2")
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.32"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═e752604c-2211-11eb-36e4-9d0ca870afa5
# ╠═e753223c-2211-11eb-1b21-77985295723c
# ╠═e75f86ee-2211-11eb-24b6-3921f08d4bfd
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
