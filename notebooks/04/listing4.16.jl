### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Distributions, KernelDensity, Plots
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.16"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	mu1, sigma1 = 10, 5
	mu2, sigma2 = 40, 12
	dist1, dist2 = Normal(mu1,sigma1), Normal(mu2,sigma2)
	p = 0.3
	mixRv() = (rand() <= p) ? rand(dist1) : rand(dist2)
	mixPDF(x) = p*pdf(dist1,x) + (1-p)*pdf(dist2,x)

	n = 2000
	data = [mixRv() for _ in 1:n]

	kdeDist = kde(data)
end

# ╔═╡ 45f535f0-250a-11eb-2a6b-03853e2d8eb1
begin
	xGrid = -20:0.1:80
	pdfKDE = pdf(kdeDist,xGrid)

	plot(xGrid, pdfKDE, c=:blue, label="KDE PDF")
	stephist!(data, bins=50, c=:black, normed=:true, label="Histogram")
	p1 = plot!(xGrid, mixPDF.(xGrid), c=:red, label="Underlying PDF",
		xlims=(-20,80), ylims=(0,0.035), legend=:topleft,
		xlabel="X", ylabel = "Density")
end

# ╔═╡ 45f5722a-250a-11eb-2840-a7d3dd59711b
begin
	hVals = [0.5,2,10]
	kdeS = [kde(data,bandwidth=h) for h in hVals]
	plot(xGrid, pdf(kdeS[1],xGrid), c = :green, label= "h=$(hVals[1])")
	plot!(xGrid, pdf(kdeS[2],xGrid), c = :blue, label= "h=$(hVals[2])")
	p2 = plot!(xGrid, pdf(kdeS[3],xGrid), c = :purple, label= "h=$(hVals[3])",
		xlims=(-20,80), ylims=(0,0.035), legend=:topleft, 
		xlabel="X", ylabel = "Density")
	plot(p1,p2,size = (800,400))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.16"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═45f535f0-250a-11eb-2a6b-03853e2d8eb1
# ╠═45f5722a-250a-11eb-2840-a7d3dd59711b
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
