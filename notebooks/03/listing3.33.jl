### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using DataFrames
	using HCubature
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.33"

# ╔═╡ 70179b62-1ea1-11eb-13ce-7fb4d54bad4b
begin
	M = 4.5
	maxD = 10
end

# ╔═╡ dde25fec-228e-11eb-2ec8-099e48158d12
f(x) = (2*pi)^(-length(x)/2) * exp(-(1/2)*x'x)

# ╔═╡ dde2935e-228e-11eb-3074-f3bddb5149fc
begin
	df = DataFrame()
	for n in 1:maxD
    	a = -M*ones(n)
    	b = M*ones(n)
    	I,e = hcubature(f, a, b, maxevals = 10^7)
    append!(df, DataFrame(:n => n, :integral => I, :error => e))
	end
	df
end

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.33"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═70179b62-1ea1-11eb-13ce-7fb4d54bad4b
# ╠═dde25fec-228e-11eb-2ec8-099e48158d12
# ╠═dde2935e-228e-11eb-3074-f3bddb5149fc
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
