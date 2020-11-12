### A Pluto.jl notebook ###
# v0.12.8

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Statistics, DataFrames, CSV
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.07"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
data = CSV.read(datadir("purchaseData.csv"), copycols=true)

# ╔═╡ bda159e6-2440-11eb-01a6-f5f4d118214e
mean(data.Price)

# ╔═╡ bda18d2e-2440-11eb-101d-f5c5084a72a4
mean(skipmissing(data.Price))

# ╔═╡ bda23ce4-2440-11eb-0b01-f1e78f176026
coalesce.(data.Grade, "QQ")[1:4]

# ╔═╡ bdac24fc-2440-11eb-0d17-71f2e8eeffc9
first(dropmissing(data,:Price), 4)

# ╔═╡ bdaca91a-2440-11eb-3e00-75b670798eea
sum(ismissing.(data.Name))

# ╔═╡ bdb6f90e-2440-11eb-1e8f-1d6fedde42e0
findall(completecases(data))[1:4]

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.07"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═bda159e6-2440-11eb-01a6-f5f4d118214e
# ╠═bda18d2e-2440-11eb-101d-f5c5084a72a4
# ╠═bda23ce4-2440-11eb-0b01-f1e78f176026
# ╠═bdac24fc-2440-11eb-0d17-71f2e8eeffc9
# ╠═bdaca91a-2440-11eb-3e00-75b670798eea
# ╠═bdb6f90e-2440-11eb-1e8f-1d6fedde42e0
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
