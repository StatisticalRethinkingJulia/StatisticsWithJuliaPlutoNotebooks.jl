### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ e077ab16-22e5-11eb-15ed-5f0654bf7328
using Pkg, DrWatson

# ╔═╡ e75a9a06-22e5-11eb-2e36-8d4f62b830ed
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Statistics, DataFrames, CSV
	using Distributions, Plots, LaTeXStrings
end;

# ╔═╡ ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
md"## Listing6.16"

# ╔═╡ 1aa41898-3afa-11eb-2f49-570853ce6435
begin
	alpha, beta = 8, 2
	data = [2,1,0,0,1,0,2,2,5,2,4,0,3,2,5,0]

	newAlpha, newBeta = alpha + sum(data), beta + length(data)
	post = Gamma(newAlpha, 1/newBeta)

	xGrid = quantile(post,0.01):0.001:quantile(post,0.99)
	significance = 0.9; halfAlpha = (1-significance)/2
end;

# ╔═╡ cd726796-3b30-11eb-15c8-85e4fb45fb10
coverage(l,u) = cdf(post,u) - cdf(post,l)

# ╔═╡ cd7297e8-3b30-11eb-1536-955db37fc8fc
function classicalCI(dist)
    l, u = mode(dist),mode(dist)
    bestl, bestu = l, u
    while  coverage(l,u) < significance 
        l -= 0.00001; u += 0.00001
    end
    (l,u)
end

# ╔═╡ cd732cee-3b30-11eb-3079-f59edcdcac91
equalTailCI(dist) = (quantile(dist,halfAlpha), quantile(dist,1-halfAlpha))

# ╔═╡ cd83989a-3b30-11eb-21ab-8d2e63f6cee0
function highestDensityCI(dist)
    height = 0.999 * maximum(pdf.(dist,xGrid))
    l,u = mode(dist),mode(dist)
    while coverage(l,u) <= significance
        range = filter(theta -> pdf(dist,theta) > height, xGrid)
        l,u = minimum(range), maximum(range)
        height -= 0.00001
    end
    (l,u)
end

# ╔═╡ cd844a56-3b30-11eb-189e-430dff8d2db3
begin
	l1, u1 = classicalCI(post)
	l2, u2 = equalTailCI(post)
	l3, u3 = highestDensityCI(post)
	Text("Classical: $((l1,u1)), Width: $(u1-l1), Coverage: $(coverage(l1,u1))")
end

# ╔═╡ cd8fc7de-3b30-11eb-3ead-afc3afc38c5a
Text("Equal tails: $((l2,u2)), Width: $(u2-l2), Coverage: $(coverage(l2,u2))")

# ╔═╡ cd98da2a-3b30-11eb-336a-3fa4180d88fe
Text("Highest density: $((l3,u3)), Width: $(u3-l3), Coverage: $(coverage(l3,u3))")

# ╔═╡ cd9a50bc-3b30-11eb-2f56-159d2cb40db5
begin
	plot(xGrid,pdf.(post,xGrid),  yticks=(0:0.25:1.25),
		c=:black, label="Gamma Posterior Distribution",
			xlims=(1.4, 2.9), ylims=(-0.4,1.25))
	plot!([l1,u1],[-0.1,-0.1], label="Classic CI", 
			c=:blue, shape=:vline, ms=16)
	plot!([l2,u2],[-0.2,-0.2], label="Equal Tail CI", 
			c=:red, shape=:vline, ms=16)
	plot!([l3,u3],[-0.3,-0.3], label="Highest Density CI", 
		c=:green, shape=:vline, ms=16, xlabel=L"\lambda", ylabel="Density")
end

# ╔═╡ 475ff888-22e6-11eb-2354-09f8f40a8e12
md"## End of listing6.16"

# ╔═╡ Cell order:
# ╟─ca5fbdc8-22e5-11eb-0a60-cb0a127a3ca5
# ╠═e077ab16-22e5-11eb-15ed-5f0654bf7328
# ╠═e75a9a06-22e5-11eb-2e36-8d4f62b830ed
# ╠═1aa41898-3afa-11eb-2f49-570853ce6435
# ╠═cd726796-3b30-11eb-15c8-85e4fb45fb10
# ╠═cd7297e8-3b30-11eb-1536-955db37fc8fc
# ╠═cd732cee-3b30-11eb-3079-f59edcdcac91
# ╠═cd83989a-3b30-11eb-21ab-8d2e63f6cee0
# ╠═cd844a56-3b30-11eb-189e-430dff8d2db3
# ╠═cd8fc7de-3b30-11eb-3ead-afc3afc38c5a
# ╠═cd98da2a-3b30-11eb-336a-3fa4180d88fe
# ╠═cd9a50bc-3b30-11eb-2f56-159d2cb40db5
# ╟─475ff888-22e6-11eb-2354-09f8f40a8e12
