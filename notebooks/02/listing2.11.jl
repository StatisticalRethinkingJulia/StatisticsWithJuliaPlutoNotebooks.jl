### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using SpecialFunctions
end

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.11"

# ╔═╡ e9fa266e-1eeb-11eb-2630-59930c474ed3
n = 2000

# ╔═╡ d595cf1a-1f62-11eb-3503-753f5260ea5c
begin
	probAgivenB(k) = 1- 1/(k+1)
	probB(k) = 6/(pi*(k+1))^2
end

# ╔═╡ d5960d36-1f62-11eb-01dc-b59f88c34a97
begin
	numerical= sum([probAgivenB(k)*probB(k) for k in 0:n])
	analytic = 1 - 6*zeta(3)/pi^2
	Text("Analytic: $(analytic) Numerical: $(numerical)")
end

# ╔═╡ ea086874-1eeb-11eb-2cb0-4186697d4294
md"## End of listing 2.11"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═e9fa266e-1eeb-11eb-2630-59930c474ed3
# ╠═d595cf1a-1f62-11eb-3503-753f5260ea5c
# ╠═d5960d36-1f62-11eb-01dc-b59f88c34a97
# ╟─ea086874-1eeb-11eb-2cb0-4186697d4294
