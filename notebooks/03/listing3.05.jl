### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Plots, LaTeXStrings
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.5"

# ╔═╡ 1bec75ec-1f9d-11eb-1296-a5f2914d82de
f2(x) = (x<0 ? x+1 : 1-x)*(abs(x)<1 ? 1 : 0)

# ╔═╡ 7bf7e1a6-1f9d-11eb-02e3-fb81fb7fd472
begin
	a, b = -1.5, 1.5
	delta = 0.01
	xGrid = a:delta:b
	F(x) = sum([f2(u)*delta for u in a:delta:x])
	y = [F(u) for u in xGrid]
end;

# ╔═╡ 7c03a482-1f9d-11eb-3313-fd537ac60b9b
plot(xGrid, y, c=:blue, xlims=(a,b), ylims=(0,1), 
	xlabel=L"x", ylabel=L"F(x)", legend=:none)

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.5"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═1bec75ec-1f9d-11eb-1296-a5f2914d82de
# ╠═7bf7e1a6-1f9d-11eb-02e3-fb81fb7fd472
# ╠═7c03a482-1f9d-11eb-3313-fd537ac60b9b
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
