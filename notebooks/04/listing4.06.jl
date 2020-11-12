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
md"## Listing4.06"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	data1 = CSV.read(datadir("purchaseData.csv"), copycols=true)
	Text("Original value: $(data1.Name[1])")
end

# ╔═╡ e303495a-243f-11eb-1440-a1d6ef299e6a
begin
	data2 = data1
	data2.Name[1] = "EMILY"
	data1.Name[1]
end

# ╔═╡ e30380ae-243f-11eb-351f-058cb130306d
begin
	data3 = CSV.read(datadir("purchaseData.csv"), copycols=true)
	data4 = copy(data3)
	data4.Name[1] = "EMILY"
	data3.Name[1]
end

# ╔═╡ e30411fc-243f-11eb-25b0-a33492c9b3fb
begin
	data5 = DataFrame()
	data5.X = [[0,1],[100,101]]
	data6 = copy(data5)
	data6.X[1][1] = -1
	data5.X[1][1]
end

# ╔═╡ e30b3752-243f-11eb-2e8d-bb6dc37d5c08
begin
	data7 = DataFrame(X = [[0,1],[100,101]])
	data8 = deepcopy(data7)
	data8.X[1][1] = -1
	data7.X[1][1]
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.06"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═e303495a-243f-11eb-1440-a1d6ef299e6a
# ╠═e30380ae-243f-11eb-351f-058cb130306d
# ╠═e30411fc-243f-11eb-25b0-a33492c9b3fb
# ╠═e30b3752-243f-11eb-2e8d-bb6dc37d5c08
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
