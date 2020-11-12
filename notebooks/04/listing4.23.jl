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
md"## Listing4.23"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
iris = dataset("datasets", "iris");

# ╔═╡ 7c93ed28-250e-11eb-1983-7bf9991291ab
@df iris violin(string.(:Species), :SepalLength, 
	fill=:blue, xlabel="Species", ylabel="Sepal Length", legend=false)

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.23"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═7c93ed28-250e-11eb-1983-7bf9991291ab
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
