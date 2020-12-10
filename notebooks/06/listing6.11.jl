### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Plots
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.11"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	mu, sig = 2, 3
	eta = sqrt(3)*sig/pi
	n, N = 15, 10^7
	dNormal   = Normal(mu, sig)
	dLogistic = Logistic(mu, eta)
	xGrid = -8:0.1:12

	sNormal   = [var(rand(dNormal,n)) for _ in 1:N]
	sLogistic = [var(rand(dLogistic,n)) for _ in 1:N]
end;

# ╔═╡ 2eb0846a-3b2b-11eb-1154-ff7ca71f3c27
begin
	p1 = plot(xGrid, pdf.(dNormal,xGrid), c=:blue, label="Normal")
	p1 = plot!(xGrid, pdf.(dLogistic,xGrid), c=:red, label="Logistic", 
		xlabel="x",ylabel="Density", xlims= (-8,12), ylims=(0,0.16))

	p2 = stephist(sNormal, bins=200, c=:blue, normed=true, label="Normal")
	p2 = stephist!(sLogistic, bins=200, c=:red, normed=true, label="Logistic", 
		xlabel="Sample Variance", ylabel="Density", xlims=(0,30), ylims=(0,0.14))

	plot(p1, p2, size=(800, 400))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.11"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═2eb0846a-3b2b-11eb-1154-ff7ca71f3c27
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
