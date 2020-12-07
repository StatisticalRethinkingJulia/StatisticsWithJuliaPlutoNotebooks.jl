### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using QuadGK, Plots
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.3"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	sup = (-1,1)
	f1(x) = 3/4*(1-x^2)
	f2(x) = x < 0 ? x+1 : 1-x

	expect(f,support) = quadgk((x) -> x*f(x),support...)[1]
end

# ╔═╡ 3a837612-1f94-11eb-315f-0d9296c7ba90
begin
	x = -1:0.01:1
	plot(x, [f1.(x), f2.(x)], lab=["f1" "f2"])
end

# ╔═╡ aa0bdedc-1f93-11eb-12a7-f3ad5370c280
Text("Mean 1: $(expect(f1,sup)), Mean 2: $(expect(f2,sup))")

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.3"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═3a837612-1f94-11eb-315f-0d9296c7ba90
# ╠═aa0bdedc-1f93-11eb-12a7-f3ad5370c280
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
