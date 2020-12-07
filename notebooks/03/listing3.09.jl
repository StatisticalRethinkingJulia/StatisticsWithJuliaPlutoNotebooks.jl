### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions, StatsPlots, LaTeXStrings
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.9"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	dist = TriangularDist(0,2,1)
	xGrid = 0:0.01:2
	uGrid = 0:0.01:1
end

# ╔═╡ a715f0ac-2034-11eb-029c-9be9db193aed
begin
	p1 = plot( xGrid, pdf.(dist,xGrid), c=:blue, 
			xlims=(0,2), ylims=(0,1.1), 
			xlabel="x", ylabel="f(x)")
	p2 = plot( xGrid, cdf.(dist,xGrid), c=:blue, 
			xlims=(0,2), ylims=(0,1), 
			xlabel="x", ylabel="F(x)")
	p3 = plot( uGrid,quantile.(dist,uGrid), c=:blue, 
			xlims=(0,1), ylims=(0,2), 
			xlabel="u", ylabel=(L"F^{-1}(u)"))

	plot(p1, p2, p3, legend=false, layout=(1,3), size=(1200, 400))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.9"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═a715f0ac-2034-11eb-029c-9be9db193aed
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
