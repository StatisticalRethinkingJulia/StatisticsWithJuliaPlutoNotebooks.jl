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
md"## Listing5.04"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
n, N, alpha = 3, 10^7, 0.1

# ╔═╡ 0a6fcc80-3a99-11eb-3de9-13429e2152ee
begin
	myT(nObs) = rand(Normal())/sqrt(rand(Chisq(nObs-1))/(nObs-1))
	mcQuantile = quantile([myT(n) for _ in 1:N],alpha)
	analyticQuantile = quantile(TDist(n-1),alpha)
end

# ╔═╡ 0a990730-3a99-11eb-0e9d-439c6e34d87c
Text("Quantile from Monte Carlo: $(mcQuantile)")

# ╔═╡ 0a998098-3a99-11eb-209b-2f467a34d644
Text("Analytic qunatile: $(analyticQuantile)")

# ╔═╡ 0a9fd40c-3a99-11eb-387b-05b58e298e6e
begin
	xGrid = -5:0.1:5
	plot(xGrid, pdf.(Normal(), xGrid), c=:black, label="Normal Distribution")
	scatter!(xGrid, pdf.(TDist(1) ,xGrid), 
		c=:blue, msw=0, label="DOF = 1")
	scatter!(xGrid, pdf.(TDist(3), xGrid), 
		c=:red, msw=0, label="DOF = 3")
	scatter!(xGrid, pdf.(TDist(100),xGrid), 
		c=:green, msw=0, label="DOF = 100", 
		xlims=(-4,4), ylims=(0,0.5), xlabel="X", ylabel="Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.04"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═0a6fcc80-3a99-11eb-3de9-13429e2152ee
# ╠═0a990730-3a99-11eb-0e9d-439c6e34d87c
# ╠═0a998098-3a99-11eb-209b-2f467a34d644
# ╠═0a9fd40c-3a99-11eb-387b-05b58e298e6e
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
