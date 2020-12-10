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
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.03"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
function statPair(dist,n)
    sample = rand(dist,n)
    [mean(sample),var(sample)]
end

# ╔═╡ 1111d8c4-252c-11eb-3813-81de856f7fba
begin
	stdUni = Uniform(-sqrt(3),sqrt(3))
	n, N = 3, 10^4

	dataUni     = [statPair(stdUni,n) for _ in 1:N]
	dataUniInd  = [[mean(rand(stdUni,n)),var(rand(stdUni,n))] for _ in 1:N]
	dataNorm    = [statPair(Normal(),n) for _ in 1:N]
	dataNormInd = [[mean(rand(Normal(),n)),var(rand(Normal(),n))] for _ in 1:N]
end;

# ╔═╡ 11120d28-252c-11eb-1c1e-0dba64d8ae5c
begin
	p1 = scatter(first.(dataUni), last.(dataUni), 
		c=:blue, ms=1, msw=0, label="Same group")
	p1 = scatter!(first.(dataUniInd), last.(dataUniInd), 
		c=:red, ms=0.8, msw=0, label="Separate group", 
		xlabel=L"\overline{X}", ylabel=L"S^2")

	p2 = scatter(first.(dataNorm), last.(dataNorm), 
		c=:blue, ms=1, msw=0, label="Same group")
	p2 = scatter!(first.(dataNormInd), last.(dataNormInd),
		c=:red, ms=0.8, msw=0, label="Separate group", 
		xlabel=L"\overline{X}", ylabel=L"$S^2$")

	plot(p1, p2, ylims=(0,5), size=(800, 400))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.03"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═1111d8c4-252c-11eb-3813-81de856f7fba
# ╠═11120d28-252c-11eb-1c1e-0dba64d8ae5c
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
