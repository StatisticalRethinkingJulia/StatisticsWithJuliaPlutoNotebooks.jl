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
	using StatsBase, LaTeXStrings
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.15"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	mu0, mu1, sd, tau  = 15, 18, 2, 17.5
	dist0, dist1 = Normal(mu0,sd), Normal(mu1,sd)
	grid = 5:0.1:25
	h0grid, h1grid = tau:0.1:25, 5:0.1:tau
end

# ╔═╡ 57e2a694-3af9-11eb-0f9e-7d8df75869e6
Text("Probability of Type I error: $(ccdf(dist0,tau))")

# ╔═╡ 57e2e668-3af9-11eb-0e7c-033e27bf1e92
Text("Probability of Type II error: $(cdf(dist1,tau))")

# ╔═╡ 57e37538-3af9-11eb-1477-b9387969d828
begin
	plot(grid, pdf.(dist0,grid),
		c=:blue, label="Bolt type 15g")
	plot!(h0grid, pdf.(dist0, h0grid), 
		c=:blue, fa=0.2, fillrange=[0 1], label="")
	plot!(grid, pdf.(dist1,grid), 
		c=:green, label="Bolt type 18g")
	plot!(h1grid, pdf.(dist1, h1grid), 
		c=:green, fa=0.2, fillrange=[0 1], label="")
	plot!([tau, 25],[0,0],
		c=:red, lw=3, label="Rejection region", 
		xlims=(5, 25), ylims=(0,0.25) , legend=:topleft,
		xlabel="x", ylabel="Density")
	annotate!([(16, 0.02, text(L"\beta")),(18.5, 0.02, text(L"\alpha")),
				(15, 0.21, text(L"H_0")),(18, 0.21, text(L"H_1"))])
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.15"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═57e2a694-3af9-11eb-0f9e-7d8df75869e6
# ╠═57e2e668-3af9-11eb-0e7c-033e27bf1e92
# ╠═57e37538-3af9-11eb-1477-b9387969d828
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
