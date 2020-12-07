### A Pluto.jl notebook ###
# v0.12.7

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
md"## Listing 1.10"

# ╔═╡ acd8c1cc-1d69-11eb-3164-5b9e66fc3664
begin
	f(x,y) = x^2 + y^2
	f0(x) = f(x,0)
	f2(x) = f(x,2)
end

# ╔═╡ ace3c478-1d69-11eb-0a4d-f191cf032e78
begin
	x, y = -5:0.1:5 , -5:0.1:5
	plot(x, [f0.(x), f2.(x)], 
		c=[:blue :red], xlims=(-5, 5), legend=:top,
		ylims=(-5, 25), ylabel=L"f(x,⋅)", label=["f(x, 0)" "f(x, 2)"])
	p1 = annotate!(-1, -0.2, text("Minimum = (0,0)", :left, :top, 10))
end

# ╔═╡ ace462fa-1d69-11eb-2b31-c1c9efe2376f
begin
	z = [ f(x,y) for y in y, x in x ]
	p2 = surface(x, y, z, c=cgrad([:blue, :red]), legend=:none, ylabel="y", zlabel="f(x,y)")
end

# ╔═╡ acf332f0-1d69-11eb-09df-43d188f0b58d
begin
	M = z[1:10,1:10]
	p3 = heatmap(M, c=cgrad([:blue, :red]), yflip=true, ylabel="y",  
		xticks=([1:10;], x), yticks=([1:10;], y))
end

# ╔═╡ ad012874-1d69-11eb-24a0-e936c7c266d5
md"## End of listing 1.10"

# ╔═╡ Cell order:
# ╟─2e6c02cc-1d69-11eb-283a-1bcf9e0044bf
# ╠═acd7da78-1d69-11eb-2517-e1bafdc14f4a
# ╠═acd82a8c-1d69-11eb-10c9-0902b833d79e
# ╠═acd8c1cc-1d69-11eb-3164-5b9e66fc3664
# ╠═ace3c478-1d69-11eb-0a4d-f191cf032e78
# ╠═ace462fa-1d69-11eb-2b31-c1c9efe2376f
# ╠═acf332f0-1d69-11eb-09df-43d188f0b58d
# ╟─ad012874-1d69-11eb-24a0-e936c7c266d5
