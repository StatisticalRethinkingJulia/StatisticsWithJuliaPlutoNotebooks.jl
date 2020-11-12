### A Pluto.jl notebook ###
# v0.12.8

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using CSV, DataFrames
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.03"

# ╔═╡ 5da2b2aa-243c-11eb-395e-a3edd16d9360
data = CSV.read(datadir("purchaseData.csv"), copycols = true)

# ╔═╡ c9268920-243c-11eb-1ddf-a75015c0bb1c
typeof(data)

# ╔═╡ 802b5c32-243c-11eb-2603-778c180b1811
first(data, 6)

# ╔═╡ 802b8b4e-243c-11eb-0fb0-e31c35cc6262
describe(data)

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
df = CSV.read(datadir("purchaseDataImputed.csv"), DataFrame; delim=",")

# ╔═╡ aae3e650-23b1-11eb-330b-af6ee2f72268
size(df)

# ╔═╡ ab0e5336-23b1-11eb-2522-8fc24ac2b5b3
names(df)

# ╔═╡ ab0ecb18-23b1-11eb-0e1a-0dc82d5fe127
first(df, 6)

# ╔═╡ ab18a048-23b1-11eb-19e7-cfa7649ae028
describe(df)

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.03"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═5da2b2aa-243c-11eb-395e-a3edd16d9360
# ╠═c9268920-243c-11eb-1ddf-a75015c0bb1c
# ╠═802b5c32-243c-11eb-2603-778c180b1811
# ╠═802b8b4e-243c-11eb-0fb0-e31c35cc6262
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═aae3e650-23b1-11eb-330b-af6ee2f72268
# ╠═ab0e5336-23b1-11eb-2522-8fc24ac2b5b3
# ╠═ab0ecb18-23b1-11eb-0e1a-0dc82d5fe127
# ╠═ab18a048-23b1-11eb-19e7-cfa7649ae028
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
