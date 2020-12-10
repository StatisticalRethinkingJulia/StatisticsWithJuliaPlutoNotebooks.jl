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
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.01"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	lambda  = 1/4.5
	expDist = Exponential(1/lambda)
	n, N    = 10, 10^6

	means     = Array{Float64}(undef, N)
	variances = Array{Float64}(undef, N)

	for i in 1:N
		data = rand(expDist,n)
		means[i] = mean(data)
		variances[i] = var(data)
	end
end

# ╔═╡ 78fd898a-2527-11eb-048f-3be84c5d8649
("Actual mean: ",mean(expDist),
		"Mean of sample means: ",mean(means))

# ╔═╡ 78fdc0d2-2527-11eb-3fe8-5738d4af3806
("Actual variance: ",var(expDist),
	"Mean of sample variances: ",mean(variances))

# ╔═╡ 78fe5bf8-2527-11eb-2c19-1d2e7d1277af
begin
	stephist(means, bins=200, c=:blue, normed=true, 
		label="Histogram of Sample Means")
	stephist!(variances, bins=600, c=:red, normed=true, 
		label="Histogram of Sample Variances", xlims=(0,40), ylims=(0,0.4),
			xlabel = "Statistic value", ylabel = "Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.01"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═78fd898a-2527-11eb-048f-3be84c5d8649
# ╠═78fdc0d2-2527-11eb-3fe8-5738d4af3806
# ╠═78fe5bf8-2527-11eb-2c19-1d2e7d1277af
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
