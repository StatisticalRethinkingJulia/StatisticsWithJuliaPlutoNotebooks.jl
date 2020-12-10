### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, Plots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.12"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	alpha = 0.05
	L(obs) = obs - (1-sqrt(alpha))
	U(obs) = obs + (1-sqrt(alpha))
end

# ╔═╡ ae6c7528-3af7-11eb-14a4-4bb1f292614b
begin
	mu = 5.57
	observation = rand(TriangularDist(mu-1,mu+1,mu))
	Text("Lower bound L: $(L(observation)))")
end

# ╔═╡ ae6cb47a-3af7-11eb-0264-bb161b7731a1
Text("Upper bound U: $(U(observation)))")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.12"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═ae6c7528-3af7-11eb-14a4-4bb1f292614b
# ╠═ae6cb47a-3af7-11eb-0264-bb161b7731a1
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
