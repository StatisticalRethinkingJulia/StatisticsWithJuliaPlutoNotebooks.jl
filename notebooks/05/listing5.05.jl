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
md"## Listing5.05"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	n1, n2 = 10, 15
	N = 10^6
	mu, sigma = 10, 4
	normDist = Normal(mu,sigma)
end;

# ╔═╡ 67a42f40-3a99-11eb-2199-cb72cdee58fa
begin
	fValues = Array{Float64}(undef, N)

	for i in 1:N
		data1 = rand(normDist,n1)
		data2 = rand(normDist,n2)
		fValues[i] = var(data1)/var(data2)
	end
end

# ╔═╡ 67a46e56-3a99-11eb-1254-3d0d490364f5
begin
	fRange = 0:0.1:5
	stephist(fValues, bins=400, c=:blue, label="Simulated", normed=true)
	plot!(fRange, pdf.(FDist(n1-1, n2-1), fRange), 
		c=:red, label="Analytic", xlims=(0,5), ylims=(0,0.8),
			xlabel = "F", ylabel = "Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.05"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═67a42f40-3a99-11eb-2199-cb72cdee58fa
# ╠═67a46e56-3a99-11eb-1254-3d0d490364f5
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
