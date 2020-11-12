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
md"## Listing4.04"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
data = CSV.read(datadir("purchaseData.csv"), copycols = true)

# ╔═╡ 700ec498-243d-11eb-30a7-0bd31057f6d6
("Grade of person 1: ", data[1, 3], 
        ", ", data[1,:Grade], 
        ", ", data.Grade[1], "\n")

# ╔═╡ 700ef812-243d-11eb-2b07-89169e32b9d9
data[[1,2,4], :]

# ╔═╡ 700f7f12-243d-11eb-3f40-d1a2c7403417
data[13:15, :Name]

# ╔═╡ 7019d3ce-243d-11eb-0703-a386528626b7
data.Name[13:15]

# ╔═╡ 701a53d6-243d-11eb-3b69-a54dfe2b3626
data[13:15, [:Name]]

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.04"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═700ec498-243d-11eb-30a7-0bd31057f6d6
# ╠═700ef812-243d-11eb-2b07-89169e32b9d9
# ╠═700f7f12-243d-11eb-3f40-d1a2c7403417
# ╠═7019d3ce-243d-11eb-0703-a386528626b7
# ╠═701a53d6-243d-11eb-3b69-a54dfe2b3626
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
