### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV, Statistics, Dates, Plots, Measures
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.19"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data = CSV.read(datadir("temperatures.csv"))
	brisbane = data.Brisbane
	goldcoast = data.GoldCoast

	diff = brisbane - goldcoast
	dates = [Date(
				Year(data.Year[i]), 
				Month(data.Month[i]), 
				Day(data.Day[i])
			) for i in 1:nrow(data)]

	fortnightRange = 250:263
	brisFortnight = brisbane[fortnightRange]
	goldFortnight = goldcoast[fortnightRange]
end;

# ╔═╡ 47673b4e-250b-11eb-16f2-2f9e1f103b04
describe(data)

# ╔═╡ 22fd2570-250b-11eb-02af-73597d381ffb
begin
	default(xlabel="Time", ylabel="Temperature")
	default(label=["Brisbane" "Gold Coast"])

	p1 = plot(dates, [brisbane goldcoast], 
			c=[:blue :red])
	p2 = plot(dates[fortnightRange], [brisFortnight goldFortnight],
			c=[:blue :red], m=(:dot, 5, Plots.stroke(1)))
	p3 = plot(dates, diff, 
			c=:black, ylabel="Temperature Difference",legend=false)
	p4 = histogram(diff, bins=-4:0.5:6, 
			ylims=(0,140), legend = false,
			xlabel="Temperature Difference", ylabel="Frequency")
	plot(p1,p2,p3,p4, size = (800,500), margin = 5mm)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.19"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═47673b4e-250b-11eb-16f2-2f9e1f103b04
# ╠═22fd2570-250b-11eb-02af-73597d381ffb
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
