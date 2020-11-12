### A Pluto.jl notebook ###
# v0.12.10

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Plots, Distributions, Random
	Random.seed!(0)
end

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing4.14"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
begin
	n = 2000
	data = rand(Normal(),n)
	l, m = minimum(data), maximum(data)

	delta = 0.3;
	bins = [(x,x+delta) for x in l:delta:m-delta]
	if last(bins)[2] < m 
		push!(bins,(last(bins)[2],m)) 
	end
	L = length(bins)
end

# ╔═╡ 77671026-24f7-11eb-13a3-4b72e9a23228
inBin(x,j) = first(bins[j]) <= x && x < last(bins[j])

# ╔═╡ 7767403c-24f7-11eb-2b4e-a53365e0cc7e
sizeBin(j) = last(bins[j]) - first(bins[j])

# ╔═╡ 7767cd10-24f7-11eb-0c8c-21a0e6b3a7c8
f(j) = sum([inBin(x,j)  for x in data])/n

# ╔═╡ 777462b4-24f7-11eb-2d4d-49436588ef26
h(x) = sum([f(j)/sizeBin(j) * inBin(x,j) for j in 1:L])

# ╔═╡ 7774fe3e-24f7-11eb-0810-390ca9b1c641
begin
	xGrid = -4:0.01:4
	histogram(data,normed=true, bins=L, 
		label="Built-in histogram",
		c=:blue, la=0, alpha=0.6)
	plot!(xGrid,h.(xGrid), lw=3, c=:red, label="Manual histogram",
		xlabel="x",ylabel="Frequency")
	plot!(xGrid,pdf.(Normal(),xGrid),label="True PDF", 
		lw=3, c=:green, xlims=(-4,4), ylims=(0,0.5))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing4.14"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═77671026-24f7-11eb-13a3-4b72e9a23228
# ╠═7767403c-24f7-11eb-2b4e-a53365e0cc7e
# ╠═7767cd10-24f7-11eb-0c8c-21a0e6b3a7c8
# ╠═777462b4-24f7-11eb-2d4d-49436588ef26
# ╠═7774fe3e-24f7-11eb-0810-390ca9b1c641
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
