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
md"## Listing 3.6"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	xGrid = 0:0.01:10
	uGrid = 0:0.01:1
	busy = 0.8
end

# ╔═╡ 80359808-20f8-11eb-01d8-a96d178126b4
begin
	F(t)= t<=0 ? 0 : 1 - busy*exp(-(1-busy)t)
	infimum(B) = isempty(B) ? Inf : minimum(B)
	invF(u) = infimum(filter((x) -> (F(x) >= u),xGrid))
end

# ╔═╡ 805b0906-20f8-11eb-1142-e99c34f90ba2
begin
	p1 = plot(xGrid, F.(xGrid), c=:blue, xlims=(-0.1,10), ylims=(0,1), 
		xlabel=L"x", ylabel=L"F(x)")

	p2 = plot(uGrid, invF.(uGrid), c=:blue, xlims=(0,0.95), ylims=(0,maximum(xGrid)),
		xlabel=L"u", ylabel=L"F^{-1}(u)")

	plot(p1, p2, legend=:none, size=(800, 400))
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.6"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═80359808-20f8-11eb-01d8-a96d178126b4
# ╠═805b0906-20f8-11eb-1142-e99c34f90ba2
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
