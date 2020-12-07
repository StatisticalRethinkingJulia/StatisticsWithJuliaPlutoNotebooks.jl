### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, Random, StatsBase, Measures
	using DataFrames, Plots, LaTeXStrings
	Random.seed!(1)
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.31"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	delta = 0.01
	grid = 0:delta:1
	f(x,y) = 9/8*(4x+y)*sqrt((1-x)*(1-y))
	z = [f(x,y) for y in grid, x in grid]

	densityIntegral = sum(z)*delta^2
	Text("2-dimensional Riemann sum over density: $(densityIntegral)")
end

# ╔═╡ f3fb9a0e-2294-11eb-227d-135a8b801a20
begin
	probB = sum([sum([f(x,y)*delta for y in x:delta:1])*delta for x in grid])
	Text("2-dimensional Riemann sum to evaluate probability: $(probB)")
end

# ╔═╡ f3fbcc54-2294-11eb-1a96-b1676ddb7772
begin
	p1 = surface(grid, grid, z, 
		c=cgrad([:blue, :red]), la=1, camera=(60,50),
		ylabel="y", zlabel=L"f(x,y)", legend=:none)
	p2 = contourf(grid, grid, z, 
		c=cgrad([:blue, :red]))
	p2 = contour!(grid, grid, z, 
		c=:black, xlims=(0,1), ylims=(0,1), ylabel="y", ratio=:equal)

	plot(p1, p2, size=(800, 400), xlabel="x", margin=5mm)
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.31"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═f3fb9a0e-2294-11eb-227d-135a8b801a20
# ╠═f3fbcc54-2294-11eb-1a96-b1676ddb7772
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
