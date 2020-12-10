### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, Statistics, Plots
	Random.seed!(2)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing5.14"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	n, N, alpha = 10, 10^7, 0.05
	mActual = 0.75
	dist0, dist1 = Uniform(0,1), Uniform(0,mActual)

	ts(sample) = maximum(sample) - minimum(sample)
end

# ╔═╡ d8d55f04-3af8-11eb-2251-75efd46ad5a2
begin
	empiricalDistUnderH0 = [ts(rand(dist0,n)) for _ in 1:N]
	rejectionValue = quantile(empiricalDistUnderH0,alpha)
end;

# ╔═╡ d8d5a0b8-3af8-11eb-1cc3-4db334734491
begin
	sample = rand(dist1,n)
	testStat = ts(sample)
	pValue = sum(empiricalDistUnderH0 .<= testStat)/N

	if testStat > rejectionValue
		print("Didn't reject: ", round(testStat,digits=4))
		print(" > ", round(rejectionValue,digits=4))
	else
		print("Reject: ", round(testStat,digits=4))
		print(" <= ", round(rejectionValue,digits=4))
	end
	Text("p-value = $(round(pValue,digits=4))")
end

# ╔═╡ d8d6283a-3af8-11eb-37cd-5fa24b45e40f
begin
	stephist(empiricalDistUnderH0, bins=100, c=:blue, normed=true, label="")
	plot!([testStat, testStat], [0,4], c=:red, label="Observed test statistic")
	plot!([rejectionValue, rejectionValue], [0,4], c=:black, ls=:dash,
		label="Critical value boundary", legend=:topleft, ylims=(0,4),
			xlabel = "x", ylabel = "Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.14"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═d8d55f04-3af8-11eb-2251-75efd46ad5a2
# ╠═d8d5a0b8-3af8-11eb-1cc3-4db334734491
# ╠═d8d6283a-3af8-11eb-37cd-5fa24b45e40f
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
