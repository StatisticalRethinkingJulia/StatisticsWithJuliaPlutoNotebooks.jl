### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using CSV, CategoricalArrays, StatsPlots
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.28"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	df = CSV.read(datadir("companyData.csv"))
	years = levels(df.Year)
	data  = reshape(df.MarketCap, 5, 3)
end

# ╔═╡ fabeade4-2522-11eb-21d7-f160a9d3f5b7
begin
	p1 = groupedbar(years, data, bar_position=:stack)
	p2 = groupedbar(years, data, bar_position=:dodge)
	plot(p1, p2, bar_width=0.7, fill=[:blue :red :green], label=["A" "B" "C"], 
		ylims=(0,6), xlabel="Year", ylabel="Market Cap (MM)", 
		legend=:topleft, size=(800,400))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.28"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═fabeade4-2522-11eb-21d7-f160a9d3f5b7
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
