### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ 1cd45b20-1dde-11eb-05e2-67d6ca635460
using Pkg, DrWatson

# ╔═╡ 1cd47d1c-1dde-11eb-21a7-97e89586fb15
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Plots
end

# ╔═╡ 8be6fd12-1ddc-11eb-1097-a7c1e739cf94
md"## Listing 1.12"

# ╔═╡ 1cd4d958-1dde-11eb-2b2a-33736cff3604
function graphCreator(n::Int)
    vertices = 1:n
    complexPts = [exp(2*pi*im*k/n) for k in vertices]
    coords = [(real(p),imag(p)) for p in complexPts]
    xPts = first.(coords)
    yPts = last.(coords)
    edges = []
    for v in vertices, u in (v+1):n
        push!(edges,(v,u)) 
    end

    anim = Animation()
    scatter(xPts, yPts, c=:blue, msw=0, ratio=1, 
        xlims=(-1.5,1.5), ylims=(-1.5,1.5), legend=:none)

    for i in 1:length(edges)
        u, v = edges[i][1], edges[i][2]
        xpoints = [xPts[u], xPts[v]]
        ypoints = [yPts[u], yPts[v]]
        plot!(xpoints, ypoints, line=(:red))
        frame(anim)
    end

    gif(anim, "graph.gif", fps = 60)
end

# ╔═╡ 1ce02ed2-1dde-11eb-1658-2d451e839c1e
graphCreator(16)

# ╔═╡ 1ce08fbc-1dde-11eb-23a8-c737b501a57f
md"## End of listing 1.12"

# ╔═╡ Cell order:
# ╟─8be6fd12-1ddc-11eb-1097-a7c1e739cf94
# ╠═1cd45b20-1dde-11eb-05e2-67d6ca635460
# ╠═1cd47d1c-1dde-11eb-21a7-97e89586fb15
# ╠═1cd4d958-1dde-11eb-2b2a-33736cff3604
# ╠═1ce02ed2-1dde-11eb-1658-2d451e839c1e
# ╟─1ce08fbc-1dde-11eb-23a8-c737b501a57f
