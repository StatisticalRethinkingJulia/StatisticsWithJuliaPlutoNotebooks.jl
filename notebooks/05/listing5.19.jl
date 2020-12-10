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
md"## Listing5.19"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	alpha, beta = 8, 2
	prior(lam) = pdf(Gamma(alpha, 1/beta), lam)
	data = [2,1,0,0,1,0,2,2,5,2,4,0,3,2,5,0]

	like(lam) = *([pdf(Poisson(lam),x) for x in data]...)
	posteriorUpToK(lam) = like(lam)*prior(lam)
end

# ╔═╡ 9ed0aafc-3afb-11eb-1f46-5bc8b9a49938
begin
	delta = 10^-4.
	lamRange = 0:delta:10
	K = sum([posteriorUpToK(lam)*delta for lam in lamRange])
	posterior(lam) = posteriorUpToK(lam)/K
end

# ╔═╡ 9ed0def2-3afb-11eb-2bd0-5b8a32cba3e1
bayesEstimate = sum([lam*posterior(lam)*delta for lam in lamRange])

# ╔═╡ 9ed16ca0-3afb-11eb-332d-3ba7b882417f
newAlpha, newBeta = alpha + sum(data), beta + length(data)

# ╔═╡ 9ed86364-3afb-11eb-0bb4-a586cc54fb14
closedFormBayesEstimate = mean(Gamma(newAlpha, 1/newBeta))

# ╔═╡ 9ee4be2c-3afb-11eb-02df-0f03e0f586fc
Text("Computational Bayes Estimate: $(bayesEstimate)")

# ╔═╡ 9ee54e44-3afb-11eb-19ef-511b9b6134a4
Text("Closed form Bayes Estimate: $(closedFormBayesEstimate)")

# ╔═╡ 9ef09b16-3afb-11eb-1cc0-a7d27312610f
begin
	plot(lamRange, prior.(lamRange), 
		c=:blue, label="Prior distribution")
	plot!(lamRange, posterior.(lamRange), 
		c=:red, label="Posterior distribution", 
		xlims=(0, 10), ylims=(0, 1.2),
			xlabel=L"\lambda",ylabel="Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.19"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═9ed0aafc-3afb-11eb-1f46-5bc8b9a49938
# ╠═9ed0def2-3afb-11eb-2bd0-5b8a32cba3e1
# ╠═9ed16ca0-3afb-11eb-332d-3ba7b882417f
# ╠═9ed86364-3afb-11eb-0bb4-a586cc54fb14
# ╠═9ee4be2c-3afb-11eb-02df-0f03e0f586fc
# ╠═9ee54e44-3afb-11eb-19ef-511b9b6134a4
# ╠═9ef09b16-3afb-11eb-1cc0-a7d27312610f
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
