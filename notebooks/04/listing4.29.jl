### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using CSV, CategoricalArrays, Plots, DataFrames
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.29"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	df = CSV.read(datadir("companyData.csv"), DataFrame)
	mktCap = reshape(df.MarketCap, 5, 3)
	years  = levels(df.Year)
end

# ╔═╡ 4829a41e-2523-11eb-3554-d9499860583f
areaplot(years, mktCap, 
	c=[:blue :red :green], labels=["A" "B" "C"],
	xlims=(minimum(years),maximum(years)), ylims=(0,6.5), 
	legend=:topleft, xlabel="Years", ylabel="MarketCap")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.29"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═4829a41e-2523-11eb-3554-d9499860583f
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
