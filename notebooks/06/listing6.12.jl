### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Plots, LaTeXStrings
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.12"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	mu, sig = 2, 3
	eta = sqrt(3)*sig/pi
	n, N = 15, 10^4
	dNormal   = Normal(mu, sig)
	dLogistic = Logistic(mu, eta)
	alphaUsed = 0.001:0.001:0.1
end;

# ╔═╡ 874034ba-3b2b-11eb-2b77-c1d2d28a1116
function alphaSimulator(dist, n, alpha)
    popVar        = var(dist)
    coverageCount = 0
    for _ in 1:N
        sVar = var(rand(dist, n))
        L = (n - 1) * sVar / quantile(Chisq(n-1),1-alpha/2)
        U = (n - 1) * sVar / quantile(Chisq(n-1),alpha/2)
        coverageCount +=  L < popVar && popVar < U
    end
    1 - coverageCount/N
end

# ╔═╡ 87407402-3b2b-11eb-36de-2b731fe48190
begin
	scatter(alphaUsed, alphaSimulator.(dNormal,n,alphaUsed), 
		c=:blue, msw=0, label="Normal")
	scatter!(alphaUsed, alphaSimulator.(dLogistic, n, alphaUsed), 
		c=:red, msw=0, label="Logistic")
	plot!([0,0.1],[0,0.1],c=:black, label="1:1 slope", 
		xlabel=L"\alpha"*" used", ylabel=L"\alpha"*" actual", 
		legend=:topleft, xlim=(0,0.1), ylims=(0,0.2))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.12"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═874034ba-3b2b-11eb-2b77-c1d2d28a1116
# ╠═87407402-3b2b-11eb-36de-2b731fe48190
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
