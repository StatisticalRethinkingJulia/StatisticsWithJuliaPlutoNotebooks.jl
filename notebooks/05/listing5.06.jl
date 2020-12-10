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
md"## Listing5.06"

# ╔═╡ fa68607e-22e5-11eb-0558-c9a4d9f77426
n, N = 30, 10^6

# ╔═╡ d599e1d4-3a99-11eb-1ab2-637caef1df0d
begin
	dist1 = Uniform(1-sqrt(3),1+sqrt(3))
	dist2 = Exponential(1)
	dist3 = Normal(1,1)

	data1 = [mean(rand(dist1,n)) for _ in 1:N]
	data2 = [mean(rand(dist2,n)) for _ in 1:N]
	data3 = [mean(rand(dist3,n)) for _ in 1:N]
end

# ╔═╡ d59a153c-3a99-11eb-1cfe-f54834ffbc5c
begin
	stephist([data1 data2 data3], bins=100, 
		c=[:blue :red :green], xlabel = "x", ylabel = "Density",
		label=["Average of Uniforms" "Average of Exponentials" "Average of Normals"], 
		normed=true, xlims=(0,2), ylims=(0,2.5))
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing5.06"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═fa68607e-22e5-11eb-0558-c9a4d9f77426
# ╠═d599e1d4-3a99-11eb-1ab2-637caef1df0d
# ╠═d59a153c-3a99-11eb-1cfe-f54834ffbc5c
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
