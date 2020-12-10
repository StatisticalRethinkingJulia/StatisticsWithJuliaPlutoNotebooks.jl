### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, Plots, LaTeXStrings
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.18"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	prior(lam) = pdf(TriangularDist(0, 10, 3), lam)
	data = [2,1,0,0,1,0,2,2,5,2,4,0,3,2,5,0]

	like(lam) = *([pdf(Poisson(lam),x) for x in data]...)
	posteriorUpToK(lam) = like(lam)*prior(lam)
end

# ╔═╡ 2bd08a88-3afb-11eb-03e1-c3af32635947
begin
	delta = 10^-4.
	lamRange = 0:delta:10
	K = sum([posteriorUpToK(lam)*delta for lam in lamRange])
	posterior(lam) = posteriorUpToK(lam)/K
end

# ╔═╡ 2bd0c412-3afb-11eb-1e28-27323df7bbe6
begin
	bayesEstimate = sum([lam*posterior(lam)*delta for lam in lamRange])
	Text("Bayes estimate: $(bayesEstimate)")
end

# ╔═╡ 2bd13636-3afb-11eb-3c12-2d5a0c0e4b13
begin
	plot(lamRange, prior.(lamRange), 
		c=:blue, label="Prior distribution")
	plot!(lamRange, posterior.(lamRange), 
		c=:red, label="Posterior distribution", 
		xlims=(0, 10), ylims=(0, 1.2),
		xlabel=L"\lambda",ylabel="Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.18"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═2bd08a88-3afb-11eb-03e1-c3af32635947
# ╠═2bd0c412-3afb-11eb-1e28-27323df7bbe6
# ╠═2bd13636-3afb-11eb-3c12-2d5a0c0e4b13
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
