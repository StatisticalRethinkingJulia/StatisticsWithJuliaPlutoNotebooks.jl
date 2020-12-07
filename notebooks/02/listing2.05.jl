### A Pluto.jl notebook ###
# v0.12.6

using Markdown
using InteractiveUtils

# ╔═╡ de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
using Pkg, DrWatson

# ╔═╡ e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
begin
	@quickactivate "StatisticsWithJuliaPlutoNotebooks"
	using Random, Combinatorics, Plots, LaTeXStrings
	Random.seed!(123)
end

# ╔═╡ ac3ceabe-1ee4-11eb-3935-313e96aafd62
md"## Listing 2.5"

# ╔═╡ d212f38c-1ee4-11eb-360a-b7d524890c8f
function isUpperLattice(v)
    for i in 1:Int(length(v)/2)
        sum(v[1:2*i-1]) >= i ? continue : return false
    end
    return true
end

# ╔═╡ 6263427a-1ee5-11eb-12d1-1d576fa18461
begin
	n, N = 5, 10^5


	omega = unique(permutations([zeros(Int,n);ones(Int,n)]))
	A = omega[isUpperLattice.(omega)]
	pA_modelI = length(A)/length(omega)
end

# ╔═╡ 62637f3a-1ee5-11eb-34e2-77e37f188fe5
function randomWalkPath(n)
    x, y = 0, 0
    path = []
    while x<n && y<n
       if rand()<0.5
            x += 1
            push!(path,0)
        else
            y += 1
            push!(path,1)
        end
    end
    append!(path, x<n ? zeros(Int64,n-x) : ones(Int64,n-y))
    return path
end

# ╔═╡ 6263f402-1ee5-11eb-20e1-5d1ebc78f310
begin
	pA_modelIIest = sum([isUpperLattice(randomWalkPath(n)) for _ in 1:N])/N
	("Model I: ",pA_modelI, "\t Model II: ", pA_modelIIest)
end

# ╔═╡ 6276d39e-1ee5-11eb-23cc-2fe5377e6ce9
function plotPath(v,l,c)
    x,y = 0,0
    graphX, graphY = [x], [y]
    for i in v
        if i == 0
            x += 1
        else
            y += 1
        end
        push!(graphX,x), push!(graphY,y)
    end
    plot!(graphX, graphY, 
            la=0.8, lw=2, label=l, c=c, ratio=:equal, legend=:topleft, 
            xlims=(0,n), ylims=(0,n), 
            xlabel=L"East\rightarrow", ylabel=L"North\rightarrow")
end

# ╔═╡ 62781fb2-1ee5-11eb-0ba1-035fa45106f5
begin
	plot()
	plotPath(rand(A), "Upper lattice path", :blue)
	plotPath(rand(setdiff(omega,A)), "Non-upper lattice path", :red)
	plot!([0, n], [0,n], ls=:dash, c=:black, label="")
end

# ╔═╡ 6285dea2-1ee5-11eb-2b6a-f9906c0d3351
md"## End of listing 2.5"

# ╔═╡ Cell order:
# ╟─ac3ceabe-1ee4-11eb-3935-313e96aafd62
# ╠═de7a5e8a-1ee4-11eb-2bbf-0f0eb3e489ec
# ╠═e4eeb13a-1ee4-11eb-0113-91f9a9c3b659
# ╠═d212f38c-1ee4-11eb-360a-b7d524890c8f
# ╠═6263427a-1ee5-11eb-12d1-1d576fa18461
# ╠═62637f3a-1ee5-11eb-34e2-77e37f188fe5
# ╠═6263f402-1ee5-11eb-20e1-5d1ebc78f310
# ╠═6276d39e-1ee5-11eb-23cc-2fe5377e6ce9
# ╠═62781fb2-1ee5-11eb-0ba1-035fa45106f5
# ╟─6285dea2-1ee5-11eb-2b6a-f9906c0d3351
