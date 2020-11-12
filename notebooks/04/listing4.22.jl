### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using CSV, StatsPlots
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.22"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data1 = CSV.read(datadir("machine1.csv"), header=false)[:,1]
	data2 = CSV.read(datadir("machine2.csv"), header=false)[:,1]
	data3 = CSV.read(datadir("machine3.csv"), header=false)[:,1]
end

# ╔═╡ 2ac4c7a6-250e-11eb-34b3-3b420e053d44
boxplot([data1,data2,data3], c=[:blue :red :green], label="", 
	xticks=([1:1:3;],["1", "2", "3"]), xlabel="Machine type",
	ylabel="Pipe Diameter (mm)")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.22"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═2ac4c7a6-250e-11eb-34b3-3b420e053d44
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
