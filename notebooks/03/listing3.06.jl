### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJulisPlutoNotebooks"
	using Plots, LaTeXStrings
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.6"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
f2(x) = (x<0 ? x+1 : 1-x)*(abs(x)<1 ? 1 : 0)

# ╔═╡ a01d1d5c-1f9e-11eb-20b3-b5c83dc40115
a, b = -1.5, 1.5

# ╔═╡ a01d5920-1f9e-11eb-3c4f-cba52cf7c820
delta = 0.01

# ╔═╡ a01dfe66-1f9e-11eb-0003-e9415a783321
F(x) = sum([f2(u)*delta for u in a:delta:x])

# ╔═╡ a0288bc4-1f9e-11eb-3701-0b34d1ad1ae1
xGrid = a:delta:b

# ╔═╡ a02f8bfe-1f9e-11eb-0b6f-3d7cff03bace
y = [F(u) for u in xGrid]

# ╔═╡ a0313c2e-1f9e-11eb-3a79-69694c6ffe8b
plot(xGrid, y, c=:blue, xlims=(a,b), ylims=(0,1), 
	xlabel=L"x", ylabel=L"F(x)", legend=:none)

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.6"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═a01d1d5c-1f9e-11eb-20b3-b5c83dc40115
# ╠═a01d5920-1f9e-11eb-3c4f-cba52cf7c820
# ╠═a01dfe66-1f9e-11eb-0003-e9415a783321
# ╠═a0288bc4-1f9e-11eb-3701-0b34d1ad1ae1
# ╠═a02f8bfe-1f9e-11eb-0b6f-3d7cff03bace
# ╠═a0313c2e-1f9e-11eb-3a79-69694c6ffe8b
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
