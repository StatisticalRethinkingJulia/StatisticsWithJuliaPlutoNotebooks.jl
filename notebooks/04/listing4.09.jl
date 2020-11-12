### A Pluto.jl notebook ###
# v0.12.8

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV, Dates, Statistics
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.09"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
data = dropmissing(CSV.read(datadir("purchaseData.csv"), copycols=true))

# ╔═╡ d4830cb6-2442-11eb-2475-75e064e51c14
begin
	data[!,:Date] = Date.(data[!,:Date], "d/m/y")
	first(sort(data, :Date), 3)
end

# ╔═╡ d4834f32-2442-11eb-0787-f14cebd337da
first(filter(row -> row[:Price] > 50000, data),3 )

# ╔═╡ d483e94c-2442-11eb-1307-3f405b818ba6
begin
	categorical!(data, :Grade)
	first(data, 3)
end

# ╔═╡ d48e90ca-2442-11eb-0d28-95f2cec59a6a
by(data, :Grade, :Price => 
       x -> ( NumSold=length(x), AvgPrice=mean(x)) )

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.09"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═d4830cb6-2442-11eb-2475-75e064e51c14
# ╠═d4834f32-2442-11eb-0787-f14cebd337da
# ╠═d483e94c-2442-11eb-1307-3f405b818ba6
# ╠═d48e90ca-2442-11eb-0d28-95f2cec59a6a
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
