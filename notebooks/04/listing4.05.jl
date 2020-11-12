### A Pluto.jl notebook ###
# v0.12.8

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames, CSV
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.05"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
data1 = CSV.read(datadir("purchaseData.csv"))

# ╔═╡ 3d63b2d0-243e-11eb-1312-ab095ba05734
data2 = CSV.read(datadir("purchaseData.csv"), copycols=true)

# ╔═╡ 3d63db0c-243e-11eb-2aaf-6b546a467ef9
try data1[1, :Name] = "YARDEN" catch; @warn "Cannot: data1 is immutable" end

# ╔═╡ 3d6454ec-243e-11eb-27ef-0f63bc8e3e5d
begin
	data2[1, :Name] = "YARDEN"
	first(data2, 3)
end

# ╔═╡ 3d6aa5cc-243e-11eb-1a5b-0b128c7a8002
begin
	data1[!, :Price] ./= 1000 
	rename!(data1, :Price=>Symbol("Price(000's)"))
	first(data1, 3)
end

# ╔═╡ 3d7655d4-243e-11eb-1e29-ebfc5d9a583a
begin
	replace!(data2[!,:Grade], ["E"=>"F", "D"=>"E"]...)
	first(data2, 3)
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.05"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═3d63b2d0-243e-11eb-1312-ab095ba05734
# ╠═3d63db0c-243e-11eb-2aaf-6b546a467ef9
# ╠═3d6454ec-243e-11eb-27ef-0f63bc8e3e5d
# ╠═3d6aa5cc-243e-11eb-1a5b-0b128c7a8002
# ╠═3d7655d4-243e-11eb-1e29-ebfc5d9a583a
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
