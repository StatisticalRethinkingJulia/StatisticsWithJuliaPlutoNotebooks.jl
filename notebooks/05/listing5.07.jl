### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Statistics, DataFrames
	Random.seed!(0)
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.07"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
trueVar, trueStd = 1/12, sqrt(1/12)

# ╔═╡ 81b26bd0-3a9a-11eb-0a09-db9eed1b0609
function estVar(n)
    sample = rand(n)
    sum((sample .- 0.5).^2)/n
end

# ╔═╡ 81b2aba4-3a9a-11eb-1bd6-a938171cf060
begin
	N = 10^7
	df = DataFrame()
	for n in 5:5:30
		biasVar = mean([estVar(n) for _ in 1:N]) - trueVar
		biasStd = mean([sqrt(estVar(n)) for _ in 1:N]) - trueStd
		append!(df, DataFrame(:n => n, :var_bias => round(biasVar, digits=5), 
				:std_bias => round(biasStd, digits=5)))
	end
	df
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.07"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═81b26bd0-3a9a-11eb-0a09-db9eed1b0609
# ╠═81b2aba4-3a9a-11eb-1bd6-a938171cf060
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
