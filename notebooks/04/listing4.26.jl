### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using RDatasets, StatsPlots
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.26"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
iris = dataset("datasets", "iris")

# ╔═╡ 8894d350-2511-11eb-39d6-110ab1ec30db
@df iris andrewsplot(:Species, cols(1:4), 
	line=(fill=[:blue :red :green]), legend=:topleft)

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.26"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═8894d350-2511-11eb-39d6-110ab1ec30db
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
