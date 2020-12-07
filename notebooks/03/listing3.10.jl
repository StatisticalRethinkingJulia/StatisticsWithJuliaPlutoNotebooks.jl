### A Pluto.jl notebook ###
# v0.12.7

using Markdown
using InteractiveUtils

# ╔═╡ 6fd616f6-1ea1-11eb-3814-8bfb4a096c49
using Pkg, DrWatson

# ╔═╡ 6ffe2628-1ea1-11eb-24ea-57f985146a72
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Distributions
end;

# ╔═╡ ed174bc4-1ea0-11eb-1e2f-a32874cec549
md"## Listing 3.10"

# ╔═╡ b7267278-2133-11eb-0f50-89cc660d3fc3
dist = TriangularDist(0,2,1)

# ╔═╡ b726b8f0-2133-11eb-090e-13eb003b6cf7
params(dist)

# ╔═╡ b7276444-2133-11eb-1818-95aafff7ec2b
Text("Central descriptors: $(mean(dist)), $(median(dist))")

# ╔═╡ ca5f5b34-2133-11eb-20c2-eda06044b2e9
Text("Dispersion descriptors: $(var(dist)), $(std(dist))")

# ╔═╡ b732099e-2133-11eb-01e3-bd42597ccab9
Text("Higher moment shape descriptors:  $(skewness(dist)), $(kurtosis(dist))")

# ╔═╡ decac540-2133-11eb-07af-3d70c3daf2fb
Text("Range:  $(minimum(dist)), $(maximum(dist))")

# ╔═╡ b73c5110-2133-11eb-3fae-65132a905cb1
Text("Mode: $(mode(dist)), Modes: $(modes(dist))")

# ╔═╡ 70182cd8-1ea1-11eb-094d-8d0d49cf15f3
md"## End of listing 3.10"

# ╔═╡ Cell order:
# ╟─ed174bc4-1ea0-11eb-1e2f-a32874cec549
# ╠═6fd616f6-1ea1-11eb-3814-8bfb4a096c49
# ╠═6ffe2628-1ea1-11eb-24ea-57f985146a72
# ╠═b7267278-2133-11eb-0f50-89cc660d3fc3
# ╠═b726b8f0-2133-11eb-090e-13eb003b6cf7
# ╠═b7276444-2133-11eb-1818-95aafff7ec2b
# ╠═ca5f5b34-2133-11eb-20c2-eda06044b2e9
# ╠═b732099e-2133-11eb-01e3-bd42597ccab9
# ╠═decac540-2133-11eb-07af-3d70c3daf2fb
# ╠═b73c5110-2133-11eb-3fae-65132a905cb1
# ╟─70182cd8-1ea1-11eb-094d-8d0d49cf15f3
