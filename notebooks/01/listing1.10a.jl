### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ acd7da78-1d69-11eb-2517-e1bafdc14f4a
using Pkg, DrWatson

# ╔═╡ acd82a8c-1d69-11eb-10c9-0902b833d79e
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Plots, LaTeXStrings, Measures
end

# ╔═╡ 2e6c02cc-1d69-11eb-283a-1bcf9e0044bf
md"## Listing 1.10a"

# ╔═╡ acd8c1cc-1d69-11eb-3164-5b9e66fc3664
begin
	f(x,y) = x^2 + y^2
	f0(x) = f(x,0)
	f2(x) = f(x,2)
end

# ╔═╡ ace462fa-1d69-11eb-2b31-c1c9efe2376f
begin
	x = -5:0.1:5
	y = -5:0.1:5
	z = [ f(x,y) for y in y, x in x ]
	p2 = surface(x, y, z, c=cgrad([:blue, :red]), legend=:none, ylabel="y", zlabel="f(x,y)")
end

# ╔═╡ ad012874-1d69-11eb-24a0-e936c7c266d5
md"## End of listing 1.10a"

# ╔═╡ Cell order:
# ╟─2e6c02cc-1d69-11eb-283a-1bcf9e0044bf
# ╠═acd7da78-1d69-11eb-2517-e1bafdc14f4a
# ╠═acd82a8c-1d69-11eb-10c9-0902b833d79e
# ╠═acd8c1cc-1d69-11eb-3164-5b9e66fc3664
# ╠═ace462fa-1d69-11eb-2b31-c1c9efe2376f
# ╟─ad012874-1d69-11eb-24a0-e936c7c266d5
