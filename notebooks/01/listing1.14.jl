### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ eb807d0e-1dfd-11eb-155d-df6f207266b9
using Pkg, DrWatson

# ╔═╡ fa048db0-1de8-11eb-20cd-9b8d6a6fd1f1
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, LinearAlgebra, Plots
	using LaTeXStrings, Measures
end

# ╔═╡ f9c7005e-1dfd-11eb-08de-4d71184b2337
md"## Listing 1.14"

# ╔═╡ 9da9d70a-1dfe-11eb-054f-ffe619ac258d
Random.seed!(1974); rand()

# ╔═╡ 9daa179c-1dfe-11eb-206d-4f94676a8104
Random.seed!(1975); rand()

# ╔═╡ 9daaa4f0-1dfe-11eb-1bb8-4f632207e49b
Random.seed!(1974); rand()

# ╔═╡ 2b564d56-1de9-11eb-120b-7137b81725dd
md"## Listing 1.15"

# ╔═╡ e9553c4a-1dfd-11eb-28d8-f3f4c0297d2a
Random.seed!()

# ╔═╡ b1edef30-1dfe-11eb-26fd-9782f1f70d10
begin
	N = 10^4
	data1     = [[rand(),rand()] for _ in 1:N]
	indata   = filter((x)-> (norm(x) <= 1), data1)
	outdata  = filter((x)-> (norm(x) > 1), data1)
	piApprox = 4*length(indata)/N
	md"Pi Estimate: $(piApprox)"
end

# ╔═╡ b1ee272a-1dfe-11eb-1956-91da67abf143
begin
	scatter(first.(indata),last.(indata), c=:blue, ms=1, msw=0)
	scatter!(first.(outdata),last.(outdata), c=:red, ms=1, msw=0,
		xlims=(0,1), ylims=(0,1), legend=:none, ratio=:equal)
end

# ╔═╡ 2e3fb9ba-1de9-11eb-0835-db03a7547b7c
md"## Listing 1.16"

# ╔═╡ 3c2312fe-1dfd-11eb-1afe-11077862ebb0
begin
	a, c, m = 69069, 1, 2^32
	next(z) = (a*z + c) % m

	#N = 10^6
	data2 = Array{Float64,1}(undef, N)

	x = 808
	
	for i in 1:N
    	data2[i] = x/m
    	global x = next(x)
	end
end

# ╔═╡ e729992c-1e00-11eb-13dc-0b9f2d96ef0d
begin
	p1 = scatter(1:1000, data2[1:1000], xlim=(0, 1000), ylim=(0,1),
		c=:blue, m=4, msw=0, xlabel=L"n", ylabel=L"x_n")
	p2 = histogram(data2, xlim=(0,1.05), bins=50, normed=:true, 
		ylims=(0,1.1), xlabel="Support", ylabel="Density")
	plot(p1, p2, size=(800, 400), legend=:none, margin = 5mm)
end

# ╔═╡ 082010d8-1de9-11eb-23df-3fd3c98c4c1d
md"## Listing 1.17"

# ╔═╡ 4441a4ba-1e01-11eb-16d8-67b2c22f7138
function path(rng, alpha, n=5000)
    x, y = 0.0, 0.0
    xDat, yDat = [], []
    for _ in 1:n
        flip = rand(rng,1:4)
        if flip == 1
            x += 1
        elseif flip == 2
            y += 1
        elseif flip == 3
            x -= (2+alpha)*rand(rng)
        elseif flip == 4
            y -= (2+alpha)*rand(rng)
        end
        push!(xDat,x)
        push!(yDat,y)
    end
    return xDat, yDat
end

# ╔═╡ 4441d4e4-1e01-11eb-201e-91694cb132aa
alphaRange = [0.2, 0.21, 0.22]

# ╔═╡ 44428c8e-1e01-11eb-0cb0-fb6fd51c9e04
default(xlabel = "x", ylabel = "y", xlims=(-150,50), ylims=(-250,50))

# ╔═╡ 4454e5fc-1e01-11eb-3d1f-bd6396d87471
begin
	p3 = plot(path(MersenneTwister(27), alphaRange[1]), c=:blue)
	plot!(path(MersenneTwister(27), alphaRange[2]), c=:red)
	plot!(path(MersenneTwister(27), alphaRange[3]), c=:green)
end;

# ╔═╡ 447a4342-1e01-11eb-22ea-a3ceff1f0df1
rng = MersenneTwister(27)

# ╔═╡ eaf93996-1e04-11eb-00d7-95f753122789
begin
	p4 = plot(path(rng, alphaRange[1]), c=:blue)
	plot!(path(rng, alphaRange[2]), c=:red)
	plot!(path(rng, alphaRange[3]), c=:green)
end;

# ╔═╡ 44a7eb76-1e01-11eb-134f-1d67bf11c36e
plot(p3, p4, size=(500, 400), legend=:none, margin=5mm)

# ╔═╡ ded51f3e-1e01-11eb-0717-af179845759e
md"## End of listing 1.14"

# ╔═╡ Cell order:
# ╟─f9c7005e-1dfd-11eb-08de-4d71184b2337
# ╠═eb807d0e-1dfd-11eb-155d-df6f207266b9
# ╠═fa048db0-1de8-11eb-20cd-9b8d6a6fd1f1
# ╠═9da9d70a-1dfe-11eb-054f-ffe619ac258d
# ╠═9daa179c-1dfe-11eb-206d-4f94676a8104
# ╠═9daaa4f0-1dfe-11eb-1bb8-4f632207e49b
# ╟─2b564d56-1de9-11eb-120b-7137b81725dd
# ╠═e9553c4a-1dfd-11eb-28d8-f3f4c0297d2a
# ╠═b1edef30-1dfe-11eb-26fd-9782f1f70d10
# ╠═b1ee272a-1dfe-11eb-1956-91da67abf143
# ╟─2e3fb9ba-1de9-11eb-0835-db03a7547b7c
# ╠═3c2312fe-1dfd-11eb-1afe-11077862ebb0
# ╠═e729992c-1e00-11eb-13dc-0b9f2d96ef0d
# ╟─082010d8-1de9-11eb-23df-3fd3c98c4c1d
# ╠═4441a4ba-1e01-11eb-16d8-67b2c22f7138
# ╠═4441d4e4-1e01-11eb-201e-91694cb132aa
# ╠═44428c8e-1e01-11eb-0cb0-fb6fd51c9e04
# ╠═4454e5fc-1e01-11eb-3d1f-bd6396d87471
# ╠═447a4342-1e01-11eb-22ea-a3ceff1f0df1
# ╠═eaf93996-1e04-11eb-00d7-95f753122789
# ╠═44a7eb76-1e01-11eb-134f-1d67bf11c36e
# ╟─ded51f3e-1e01-11eb-0717-af179845759e
