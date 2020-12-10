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
md"## Listing5.09"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	actualAlpha, actualLambda = 2,3
	gammaDist = Gamma(actualAlpha,1/actualLambda)
	n = 10^2
	sample = rand(gammaDist, n)
end

# ╔═╡ 68b12c46-3a9c-11eb-03b3-bf9862c5371c
begin
	alphaGrid = 1:0.02:3
	lambdaGrid = 2:0.02:5
end

# ╔═╡ 68b16da0-3a9c-11eb-21e2-53c689f1599c
likelihood = [prod([pdf.(Gamma(a,1/l),v) for v in sample])
                        for l in lambdaGrid, a in alphaGrid]

# ╔═╡ 68b1f8ce-3a9c-11eb-2ad9-a5af4bd66c0e
surface(alphaGrid, lambdaGrid, likelihood, lw=0.1, 
	c=cgrad([:blue, :red]), legend=:none, camera = (135,20),
	xlabel=L"\alpha", ylabel=L"\lambda", zlabel="Likelihood")

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.09"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═68b12c46-3a9c-11eb-03b3-bf9862c5371c
# ╠═68b16da0-3a9c-11eb-21e2-53c689f1599c
# ╠═68b1f8ce-3a9c-11eb-2ad9-a5af4bd66c0e
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
