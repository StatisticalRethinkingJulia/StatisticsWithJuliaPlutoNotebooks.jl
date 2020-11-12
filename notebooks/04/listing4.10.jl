### A Pluto.jl notebook ###
# v0.12.8

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV, Statistics
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.10"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = CSV.read(datadir("purchaseData.csv"))
	rowsKeep = .!(ismissing.(data.Grade) .& ismissing.(data.Price))
	data = data[rowsKeep, :]
end

# ╔═╡ 02c4946e-2445-11eb-3c51-b550096ab843
begin
	replace!(x -> ismissing(x) ? "QQ" : x, data.Name)
	replace!(x -> ismissing(x) ? "31/06/2008" : x, data.Date)

	grPr = by(dropmissing(data), :Grade, :Price=>x -> 
		AvgPrice = round(mean(x), digits=-3))

	d = Dict(grPr[:,1] .=> grPr[:,2])
	nearIndx(v, x) = findmin(abs.(v.-x))[2]
	for i in 1:nrow(data)
		if ismissing(data[i, :Price]) 
			data[i, :Price] = d[data[i, :Grade]]
		end
		if ismissing(data[i, :Grade])
			data[i, :Grade] = grPr[ nearIndx(grPr[:,2], data[i, :Price]), :Grade]
		end   
	end
end

# ╔═╡ 02c50672-2445-11eb-03bc-d763278b5f14
first(data, 5)

# ╔═╡ 02d285fe-2445-11eb-1150-e9fa017e6170
describe(data)

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.10"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═02c4946e-2445-11eb-3c51-b550096ab843
# ╠═02c50672-2445-11eb-03bc-d763278b5f14
# ╠═02d285fe-2445-11eb-1150-e9fa017e6170
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
