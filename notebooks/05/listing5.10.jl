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
	using SpecialFunctions, Roots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.10"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
eq(alpha, xb, xbl) = log(alpha) - digamma(alpha) - log(xb) + xbl

# ╔═╡ 06e24b20-3a9d-11eb-3557-97a1adc9f46e
begin
	actualAlpha, actualLambda = 2, 3
	gammaDist = Gamma(actualAlpha,1/actualLambda)
end

# ╔═╡ 06e27366-3a9d-11eb-211e-df469e196f9d
function mle(sample)
    alpha  = find_zero( (a)->eq(a,mean(sample),mean(log.(sample))), 1)
    lambda = alpha/mean(sample)
    return [alpha,lambda]
end

# ╔═╡ 7f6ea3be-3a9e-11eb-1287-4f1bc371585a
alpha

# ╔═╡ 06e2dc20-3a9d-11eb-2aed-6745e3221343
begin
	N = 10^4
	mles10   = [mle(rand(gammaDist,10)) for _ in 1:N]
	mles100  = [mle(rand(gammaDist,100)) for _ in 1:N]
	mles1000 = [mle(rand(gammaDist,1000)) for _ in 1:N]
end

# ╔═╡ 06ef2bc2-3a9d-11eb-3563-8b81e34087da
begin
	scatter(first.(mles10), last.(mles10), 
		c=:blue, ms=1, msw=0, label="n = 10")
	scatter!(first.(mles100), last.(mles100), 
		c=:red, ms=1, msw=0, label="n = 100")
	scatter!(first.(mles1000), last.(mles1000), 
		c=:green, ms=1, msw=0, label="n = 1000", 
		xlims=(0,6), ylims=(0,8), xlabel=L"\alpha", ylabel=L"\lambda")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.10"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═06e24b20-3a9d-11eb-3557-97a1adc9f46e
# ╠═06e27366-3a9d-11eb-211e-df469e196f9d
# ╠═7f6ea3be-3a9e-11eb-1287-4f1bc371585a
# ╠═06e2dc20-3a9d-11eb-2aed-6745e3221343
# ╠═06ef2bc2-3a9d-11eb-3563-8b81e34087da
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
