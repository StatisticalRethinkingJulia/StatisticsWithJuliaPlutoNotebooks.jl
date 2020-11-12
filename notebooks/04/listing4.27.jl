### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using CSV, CategoricalArrays, Plots
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.27"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	df = CSV.read(datadir("companyData.csv"))
	companies = levels(df.Type)

	year2012 = df[df.Year .== 2012, :MarketCap]
	year2016 = df[df.Year .== 2016, :MarketCap]
end

# ╔═╡ 9b9baab2-2522-11eb-0bfb-0bdfde4381ea
begin
	p1 = pie(companies, year2012, title="2012 Market Cap \n by company")
	p2 = pie(companies, year2016, title="2016 Market Cap \n by company")
	plot(p1, p2, size=(800, 400))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.27"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═9b9baab2-2522-11eb-0bfb-0bdfde4381ea
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
