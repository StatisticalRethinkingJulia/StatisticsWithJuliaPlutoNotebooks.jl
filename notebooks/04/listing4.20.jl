### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV, Dates, StatsBase, Plots, TimeSeries
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.20"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = CSV.read(datadir("temperatures.csv"),copycols = true)
	brisbane = data.Brisbane
	dates = [Date(
				Year(data.Year[i]), 
				Month(data.Month[i]), 
				Day(data.Day[i])
			) for i in 1:nrow(data)]

	window1, window2 = 7, 14
	d1 = values(moving(mean,TimeArray(dates,brisbane),window1))
	d2 = values(moving(mean,TimeArray(dates,brisbane),window2))
end;

# ╔═╡ 56bc1334-250c-11eb-3c15-f98b6097c3a6
begin
	grid = (2pi:-2pi/365:0) .+ pi/2
	monthsNames = Dates.monthname.(dates[1:31:365])

	plot(grid, d1[1:366], 
		c=:blue, proj=:polar, label="Brisbane weekly average temp.")
	plot!(grid, d2[1:366], 
		xticks=([mod.((11pi/6:-pi/6:0) .+ pi/2,2pi) ;], monthsNames),
		c=:red, proj=:polar, 
		label="Brisbane fortnightly average temp.", legend=:outerbottom)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.20"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═56bc1334-250c-11eb-3c15-f98b6097c3a6
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
