### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, StatsPlots
	Random.seed!(2)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.13"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	alpha  = 0.05
	L(obs) = obs - (1-sqrt(alpha))
	U(obs) = obs + (1-sqrt(alpha))

	mu = 5.57
	triDist = TriangularDist(mu-1,mu+1,mu)
end

# ╔═╡ 28756a6e-3af8-11eb-012f-93dc4ef1c3c9
begin
	N = 100
	hitBounds, missBounds = zeros(N, 2), zeros(N,2)
	for i in 1:N
		observation = rand(triDist)
		LL, UU = L(observation), U(observation)
		if LL <= mu && mu <= UU
			hitBounds[i,:] = [LL  UU-LL]
		else
			missBounds[i,:] = [LL  UU-LL]
		end
	end
end

# ╔═╡ 28759980-3af8-11eb-17c2-a3ee2e86a55d
begin
	groupedbar(hitBounds, bar_position=:stack, 
		c=:blue, la=0, fa=[0 1], label="", ylims=(3,8))
	groupedbar!(missBounds, bar_position=:stack, 
		c=:red, la=0, fa=[0 1], label="", ylims=(3,8))
	plot!([0,N+1],[mu,mu],
		c=:black, xlims=(0,N+1), 
		ylims=(3,8), label="Parameter value", ylabel="Value Estimate")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.13"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═28756a6e-3af8-11eb-012f-93dc4ef1c3c9
# ╠═28759980-3af8-11eb-17c2-a3ee2e86a55d
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
